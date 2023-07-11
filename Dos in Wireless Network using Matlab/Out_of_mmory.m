x = readtable("/MATLAB Drive/UNSW_NB15_training-set.csv");
data = x(:,vartype("numeric"));
[N,D] = size(data);
contaminationFraction = 0.05;
rng("default") % For reproducibility
[forest,tf_forest,s_forest] = iforest(data, ...
    ContaminationFraction=contaminationFraction);
figure
histogram(s_forest,Normalization="probability")
xline(forest.ScoreThreshold,"k-", ...
    join(["Threshold =" forest.ScoreThreshold]))
title("Histogram of Anomaly Scores")
OF_forest = sum(tf_forest)/N;
[LOFObj,tf_lof,s_lof] = lof(data, ...
    ContaminationFraction=contaminationFraction, ...
    NumNeighbors=500,Distance="mahalanobis");
figure
histogram(s_lof,Normalization="probability")
xline(LOFObj.ScoreThreshold,"k-", ...
    join(["Threshold =" LOFObj.ScoreThreshold]))
title("Histogram of Anomaly Scores for Local Outlier Factor")
OF_lof = sum(tf_lof)/N;
[Mdl,tf_OCSVM,s_OCSVM] = ocsvm(data, ...
    ContaminationFraction=contaminationFraction, ...
    KernelScale="auto",StandardizeData=true);
figure
histogram(s_OCSVM,Normalization="probability")
xline(Mdl.ScoreThreshold,"k-", ...
    join(["Threshold =" Mdl.ScoreThreshold]))
title("Histogram of Anomaly Scores for One-Class SVM")
OF_OCSVM = sum(tf_OCSVM)/N;
