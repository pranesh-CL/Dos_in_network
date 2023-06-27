% Load the dataset into a table
data = readtable('C:/matlab/project/UNSW_NB15_training-set.csv');

% Convert the non-numerical feature "color" into numerical feature "color_enc"
data_categories = unique(data.attack_cat);
num_categories = length(data_categories);

for i=1:num_categories
    idx = strcmp(data.attack_cat, data_categories(i));
    data.attack_cat_enc(idx) = i;
end



% Write the updated data to a new CSV file
writetable(data, 'encoded_dataset.csv');