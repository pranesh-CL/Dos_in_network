% Load the dataset into a table
data = readtable('C:/matlab/project/UNSW_NB15_training-set.csv');

% Convert the non-numerical feature "color" into numerical feature "color_enc"
data_categories = unique(data.state);
num_categories = length(data_categories);

for i=1:num_categories
    idx = strcmp(data.state, data_categories(i));
    data.state_enc(idx) = i;
end



% Write the updated data to a new CSV file
writetable(data, 'encoded_dataset.csv');