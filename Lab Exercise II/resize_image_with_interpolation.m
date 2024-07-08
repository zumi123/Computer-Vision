function resize_image_with_interpolation(image_path, new_width, new_height)
    % Resize an image using different interpolation techniques and compare results
    % image_path: Path to the image file
    % new_width: Desired width of the resized image
    % new_height: Desired height of the resized image

    % Load the image package
    pkg load image;

    % Read the original image
    original_image = imread(image_path);

    % Nearest Neighbor Interpolation
    tic;
    resized_nearest = imresize(original_image, [new_height, new_width], 'nearest');
    time_nearest = toc;

    % Bilinear Interpolation
    tic;
    resized_bilinear = imresize(original_image, [new_height, new_width], 'bilinear');
    time_bilinear = toc;

    % Bicubic Interpolation
    tic;
    resized_bicubic = imresize(original_image, [new_height, new_width], 'bicubic');
    time_bicubic = toc;

    % Display the original and resized images
    figure;
    
    subplot(2, 2, 1);
    imshow(original_image);
    title('Original Image');
    
    subplot(2, 2, 2);
    imshow(resized_nearest);
    title(sprintf('Nearest Neighbor (%.2f s)', time_nearest));

    subplot(2, 2, 3);
    imshow(resized_bilinear);
    title(sprintf('Bilinear (%.2f s)', time_bilinear));

    subplot(2, 2, 4);
    imshow(resized_bicubic);
    title(sprintf('Bicubic (%.2f s)', time_bicubic));

    % Print the resizing times
    fprintf('Nearest Neighbor Interpolation Time: %.2f seconds\n', time_nearest);
    fprintf('Bilinear Interpolation Time: %.2f seconds\n', time_bilinear);
    fprintf('Bicubic Interpolation Time: %.2f seconds\n', time_bicubic);
end

