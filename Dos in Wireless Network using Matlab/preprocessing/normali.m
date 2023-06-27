min_vals = min('C:/matlab/project/preprocessing/encoded_datasetnew.xls');
max_vals = max('C:/matlab/project/preprocessing/encoded_datasetnew.xls');
range = max_vals - min_vals;
normalized = ('C:/matlab/project/UNSW_NB15_training-set.csv' - min_vals) ./ range;
num_decimal_places = 3; % for example
normalized = round(normalized, num_decimal_places);
writetable('normalized_data.xls', normalized);
