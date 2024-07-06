pkg load image;  % Load the image package

% Define directories for positive and negative images
positive_dir = 'Z:\AAIT\Computer Vision\Project1\Surface Crack Detection\Positive1/';
negative_dir = 'Z:\AAIT\Computer Vision\Project1\Surface Crack Detection\Negative1/';

% Load image file names
positive_files = dir(fullfile(positive_dir, '*.jpg'));
negative_files = dir(fullfile(negative_dir, '*.jpg'));

% Initialize image containers
num_positive = length(positive_files);
num_negative = length(negative_files);
total_images = num_positive + num_negative;

% Define image dimensions
img_height = 227;
img_width = 227;

% Placeholder for labels
labels = [ones(num_positive, 1); zeros(num_negative, 1)]; % 1 for crack, 0 for no crack

% Parameters for batch processing
batch_size = 200;  % Number of images to process in each batch
num_batches = ceil(total_images / batch_size);

features = [];
all_labels = [];

for batch = 1:num_batches
    fprintf('Processing batch %d of %d\n', batch, num_batches);
    start_idx = (batch - 1) * batch_size + 1;
    end_idx = min(batch * batch_size, total_images);
    
    batch_features = [];
    batch_labels = labels(start_idx:end_idx);

    for i = start_idx:end_idx
        if i <= num_positive
            img = imread(fullfile(positive_dir, positive_files(i).name));
        else
            img = imread(fullfile(negative_dir, negative_files(i - num_positive).name));
        end
        
        gray_img = rgb2gray(img);
        filtered_img = medfilt2(gray_img, [3, 3]);
        edges = edge(filtered_img, 'Canny');
        
        % Flatten edge image and add to batch features
        edge_flat = reshape(edges, 1, []);
        batch_features = [batch_features; edge_flat];
    end

    % Append batch features and labels to overall dataset
    features = [features; batch_features];
    all_labels = [all_labels; batch_labels];
end

% Split data into training and testing sets
train_ratio = 0.8;
train_size = round(train_ratio * total_images);
test_size = total_images - train_size;

% Randomly shuffle data
rand_indices = randperm(total_images);
train_indices = rand_indices(1:train_size);
test_indices = rand_indices(train_size+1:end);

% Prepare training and testing data
train_features = features(train_indices, :);
train_labels = all_labels(train_indices);
test_features = features(test_indices, :);
test_labels = all_labels(test_indices);

% Implementing k-NN classification
k = 5;  % Number of neighbors
predictions = zeros(test_size, 1);

for i = 1:test_size
    distances = sqrt(sum((train_features - test_features(i, :)).^2, 2));
    [sorted_distances, sorted_indices] = sort(distances);
    nearest_labels = train_labels(sorted_indices(1:k));
    predictions(i) = mode(nearest_labels);
end

% Calculate accuracy
accuracy = sum(predictions == test_labels) / test_size;
disp(['Test Accuracy: ', num2str(accuracy)]);

% Visualize some results
for i = 1:5  % Display first 5 test images and their predictions
    img_idx = test_indices(i);
    if img_idx <= num_positive
        img = imread(fullfile(positive_dir, positive_files(img_idx).name));
    else
        img = imread(fullfile(negative_dir, negative_files(img_idx - num_positive).name));
    end
    
    pred_label = predictions(i);
    true_label = test_labels(i);
    
    figure;
    imshow(img);
    title(['True: ', num2str(true_label), ' - Predicted: ', num2str(pred_label)]);
    pause(1);
end

% Display summary of results
disp('Summary of Crack Detection:');
disp('----------------------------');
for i = 1:test_size
    img_idx = test_indices(i);
    pred_label = predictions(i);
    true_label = test_labels(i);
    disp(['Image ', num2str(i), ' - True: ', num2str(true_label), ' - Predicted: ', num2str(pred_label)]);
end
