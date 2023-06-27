[~,scores,pcvars] = pca(exression);
x = scores(:,1);
y = scores(:,2);
z = scores(:,3);

gscatter3(x,y,z,kddcup99_csv,{'b','g','m'},{'.','.','.'},15);
title('kddcup99 dataset');
pcvars(1)/sum(pcvars)*100;