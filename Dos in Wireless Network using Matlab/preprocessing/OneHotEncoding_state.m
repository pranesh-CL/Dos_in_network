% Load the dataset into a table
data = readtable('C:/matlab/project/UNSW_NB15_training-set.csv');

% Convert the non-numerical feature "color" into one-hot encoded features
dummies = dummyvar(categorical(data.state));
num_categories = size(dummies, 2);

for i=1:num_categories
    data.(sprintf("state_%d", i)) = dummies(:,i);
end

% Remove the original "color" feature
data = removevars(data, 'state');

% Write the updated data to a new CSV file
writetable(data, 'encoded_datasetnew.csv');