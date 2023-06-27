data = readtable("C:/matlab/project/NSL KDD/KDDTest+.csv");
head(data)

src_bytes = data(:,5) ==1;
dst_bytes = data(:,5) ==2;
dst_host_same_src_port_rate = data(:,5) ==3;

setosa = data(setosaIndex,:);
versicolor = data(versicolorIndex,:);
virginica = data(virginicaIndex,:);