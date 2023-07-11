clc
clear all
close all
warning off
x=readtable('C:/matlab/project/UNSW_NB15_training-set.csv');

data=x(:,6:end-2);
data.sjit=(data.sjit-mean(data.sjit))/std(data.sjit);
data.djit=(data.djit-mean(data.djit))/std(data.djit);
data.sbytes=(data.sbytes-mean(data.sbytes))/std(data.sbytes);
data.ct_ftp_cmd=(data.ct_ftp_cmd-mean(data.ct_ftp_cmd))/std(data.ct_ftp_cmd);
data.ct_flw_http_mthd=(data.ct_flw_http_mthd-mean(data.ct_flw_http_mthd))/std(data.ct_flw_http_mthd);
data.dbytes=(data.dbytes-mean(data.dbytes))/std(data.dbytes);
data.rate=(data.rate-mean(data.rate))/std(data.rate);
data.sttl=(data.sttl-mean(data.sttl))/std(data.sttl);
data.dttl=(data.dttl-mean(data.dttl))/std(data.dttl);
data.sload=(data.sload-mean(data.sload))/std(data.sload);
data.dload=(data.dload-mean(data.dload))/std(data.dload);
data.sloss=(data.sloss-mean(data.sloss))/std(data.sloss);
data.dloss=(data.dloss-mean(data.dloss))/std(data.dloss);
data.sinpkt=(data.sinpkt-mean(data.sinpkt))/std(data.sinpkt);
data.dinpkt=(data.dinpkt-mean(data.dinpkt))/std(data.dinpkt);
Data=table2array(data);
[idx c sumd]=kmeans(Data,15);
[coeff,score,latent,tsquared,expalined,mu]=pca(Data);
pc1=score(:,1);
pc2=score(:,2);
figure;
gscatter(pc1,pc2,idx);

