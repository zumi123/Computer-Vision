function adjust_pixel_values(image_path, scale_factor, translation_value)
    % Adjust pixel values of an image using scaling and translation
    % image_path: Path to the image file
    % scale_factor: Factor by which to scale pixel values
    % translation_value: Value to add to pixel values (translation)

    % Load the image package
    pkg load image;

    % Read the original image
    original_image = imread(image_path);

    % Convert the image to double precision for mathematical operations
    img_double = im2double(original_image);

    % Apply scaling and translation
    adjusted_image = img_double * scale_factor + translation_value;

    % Clip the values to be in the valid range [0, 1] for display
    adjusted_image = min(max(adjusted_image, 0), 1);

    % Convert the adjusted image back to uint8 for display
    adjusted_image_uint8 = im2uint8(adjusted_image);

    % Display the original and adjusted images
    figure;
    
    subplot(1, 2, 1);
    imshow(original_image);
    title('Original Image');

    subplot(1, 2, 2);
    imshow(adjusted_image_uint8);
    title(sprintf('Adjusted Image\n(Scale: %.2f, Translate: %.2f)', scale_factor, translation_value));
end

adjust_pixel_values('Z:\AAIT\Computer Vision\images/Mandrill.jpg', 1.2, 0.1);
