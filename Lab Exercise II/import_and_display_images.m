function import_and_display_images(directory)
    % Import and display images from a specified directory using different colormaps
    % directory: the path to the directory containing images

    % Supported image formats
    supported_formats = {'*.png', '*.jpg', '*.jpeg', '*.bmp'};
    images = [];
    image_names = [];
    
    % Read images from directory
    for i = 1:length(supported_formats)
        files = dir(fullfile(directory, supported_formats{i}));
        for j = 1:length(files)
            try
                img = imread(fullfile(directory, files(j).name));
                images{end+1} = img; %#ok<AGROW>
                image_names{end+1} = files(j).name; %#ok<AGROW>
            catch err
                fprintf('Error reading %s: %s\n', files(j).name, err.message);
            end
        end
    end

    % Display images with different colormaps
    colormaps = {'gray', 'hot', 'jet'};
    
    for i = 1:length(images)
        img = images{i};
        figure('Name', image_names{i});
        for j = 1:length(colormaps)
            subplot(1, length(colormaps), j);
            imshow(img, []);
            colormap(colormaps{j});
            title(colormaps{j});
        end
    end
end

