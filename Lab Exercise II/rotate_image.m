function rotate_image(image_path, angle)
    % Rotate an image by a specified angle and handle changes in image size and aspect ratio
    % image_path: Path to the image file
    % angle: Angle by which the image is to be rotated (in degrees)

    % Load the image package
    pkg load image;

    % Read the original image
    original_image = imread(image_path);

    % Rotate the image
    rotated_image = imrotate(original_image, angle);

    % Display the original and rotated images
    figure;
    
    subplot(1, 2, 1);
    imshow(original_image);
    title('Original Image');
    
    subplot(1, 2, 2);
    imshow(rotated_image);
    title(sprintf('Rotated Image (%.1f degrees)', angle));

    % Save the rotated image (optional)
    [~, name, ext] = fileparts(image_path);
    rotated_image_path = sprintf('%s_rotated%.1f%s', name, angle, ext);
    imwrite(rotated_image, rotated_image_path);
    fprintf('Rotated image saved as: %s\n', rotated_image_path);
end
