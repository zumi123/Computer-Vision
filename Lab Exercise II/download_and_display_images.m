function download_and_display_images(urls, save_directory)
    % Download and display images from specified URLs
    % urls: Cell array of URLs to download images from
    % save_directory: Directory to save the downloaded images

    % Create the save directory if it doesn't exist
    if ~exist(save_directory, 'dir')
        mkdir(save_directory);
    end

    % Load the necessary package for downloading files
    pkg load io;

    % Iterate over the URLs to download and save the images
    for i = 1:length(urls)
        url = urls{i};
        [~, name, ext] = fileparts(url);
        save_path = fullfile(save_directory, strcat(name, ext));

        try
            fprintf('Downloading image from: %s\n', url);
            urlwrite(url, save_path);
            fprintf('Image saved as: %s\n', save_path);
        catch
            fprintf('Error downloading image from: %s\n', url);
            continue;
        end

        % Read and display the downloaded image
        try
            img = imread(save_path);
            figure;
            imshow(img);
            title(sprintf('Downloaded Image: %s', strcat(name, ext)));
        catch
            fprintf('Error displaying image from: %s\n', save_path);
        end
    end
end

urls = {
    'https://images.ctfassets.net/3viuren4us1n/1Ghw96A2tcYRfRezOwtmjx/e646778f3f53e50ea3e857e9cdb23120/Computer_vision.jpg'
};
save_directory = 'Z:\AAIT\Computer Vision\Lab\Processes image';
download_and_display_images(urls, save_directory);

