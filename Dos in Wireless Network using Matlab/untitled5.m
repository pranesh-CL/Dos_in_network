% Import the dataset
data = readtable('C:/matlab/project/kddcup99_csv.csv');

% Remove duplicate rows
data = unique(data, 'rows');

% Remove irrelevant columns
%data(:,[2 4 5 9 10 11 12 20]) = [];

% Remove NaN values
data = rmmissing(data);

% Remove outliers
z_scores = zscore(data{:,1:28});
data = data(abs(z_scores) < 3, :);

% Normalize the data
data{:,1:28} = normalize(data{:,1:28});

% Save the cleaned data to a new CSV file
writetable(data, 'kddcup99_cleaned.csv');