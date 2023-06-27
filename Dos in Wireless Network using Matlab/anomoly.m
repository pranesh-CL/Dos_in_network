data = readtable("C:/matlab/project/UNSW KD15/UNSW_NB15_training-set.csv");
data1 = readtable("C:/matlab/project/UNSW KD15/UNSW_NB15_testing-set.csv");
adultdata = data(:,vartype("numeric"));
adulttest = data1(:,vartype("numeric"));
[Mdl,tf,s] = lof(adultdata);
Mdl.ScoreThreshold
[tf_test,s_test] = isanomaly(Mdl,adulttest);
h1 = histogram(s,NumBins=50,Normalization="probability");
hold on
h2 = histogram(s_test,h1.BinEdges,Normalization="probability");
xline(Mdl.ScoreThreshold,"r-",join(["Threshold" Mdl.ScoreThreshold]))
h1.Parent.YScale = 'log';
h2.Parent.YScale = 'log';
legend("Training Data","Test Data",Location="north")
hold off
find(tf_test)