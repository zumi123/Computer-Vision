function crop_image(image_path, top_left, bottom_right)
    % Crop an image to a specific region of interest
    % image_path: Path to the image file
    % top_left: Coordinates of the top-left corner of the crop region [x, y]
    % bottom_right: Coordinates of the bottom-right corner of the crop region [x, y]

    % Load the image package
    pkg load image;

    % Read the original image
    original_image = imread(image_path);

    % Extract coordinates
    x1 = top_left(1);
    y1 = top_left(2);
    x2 = bottom_right(1);
    y2 = bottom_right(2);

    % Crop the image
    cropped_image = original_image(y1:y2, x1:x2, :);

    % Display the original and cropped images
    figure;
    
    subplot(1, 2, 1);
    imshow(original_image);
    title('Original Image');
    
    subplot(1, 2, 2);
    imshow(cropped_image);
    title('Cropped Image');

    % Save the cropped image (optional)
    [~, name, ext] = fileparts(image_path);
    cropped_image_path = sprintf('%s_cropped%s', name, ext);
    imwrite(cropped_image, cropped_image_path);
    fprintf('Cropped image saved as: %s\n', cropped_image_path);
end
