clc
clear all
close all
warning off
x=readtable('C:/Users/pranesh/OneDrive/Documents/MATLAB/kddcup99_csv.csv');

data=x(:,5:end-1);
data.num_failed_logins=(data.num_failed_logins-mean(data.num_failed_logins))/std(data.num_failed_logins);
data.logged_in=(data.logged_in-mean(data.logged_in))/std(data.logged_in);
data.dst_host_count=(data.dst_host_count-mean(data.dst_host_count))/std(data.dst_host_count);
data.land=(data.land-mean(data.land))/std(data.land);
data.src_bytes=(data.src_bytes-mean(data.src_bytes))/std(data.src_bytes);
data.dst_bytes=(data.dst_bytes-mean(data.dst_bytes))/std(data.dst_bytes);
data.wrong_fragment=(data.wrong_fragment-mean(data.wrong_fragment))/std(data.wrong_fragment);
data.urgent=(data.urgent-mean(data.urgent))/std(data.urgent);
data.hot=(data.hot-mean(data.hot))/std(data.hot);
data.num_failed_logins=(data.num_failed_logins-mean(data.num_failed_logins))/std(data.num_failed_logins);
data.lnum_compromised=(data.lnum_compromised-mean(data.lnum_compromised))/std(data.lnum_compromised);
data.lroot_shell=(data.lroot_shell-mean(data.lroot_shell))/std(data.lroot_shell);
data.lsu_attempted=(data.lsu_attempted-mean(data.lsu_attempted))/std(data.lsu_attempted);
data.lnum_root=(data.lnum_root-mean(data.lnum_root))/std(data.lnum_root);
data.lnum_file_creations=(data.lnum_file_creations-mean(data.lnum_file_creations))/std(data.lnum_file_creations);
Data=table2array(data);
[idx c sumd]=kmeans(Data,15);

pc1=score(:,1);
pc2=score(:,2);
figure;
gscatter(pc1,pc2,idx);

