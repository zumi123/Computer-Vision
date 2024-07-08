function grayscale_conversion_methods(image_path)
    % Grayscale Conversion Methods
    % image_path: Path to the color image file

    % Load the image package
    pkg load image;

    % Read the original color image
    try
        original_image = imread(image_path);
    catch
        error('Error: Unable to read image from path: %s', image_path);
    end

    % Average Method
    grayscale_average = mean(original_image, 3);

    % Luminosity Method
    grayscale_luminosity = 0.21 * original_image(:, :, 1) + 0.72 * original_image(:, :, 2) + 0.07 * original_image(:, :, 3);

    % Desaturation Method
    max_rgb = max(original_image, [], 3);
    min_rgb = min(original_image, [], 3);
    grayscale_desaturation = (max_rgb + min_rgb) / 2;

    % Display the original and grayscale images
    figure;
    
    subplot(2, 2, 1);
    imshow(original_image);
    title('Original Image');
    
    subplot(2, 2, 2);
    imshow(grayscale_average, []);
    title('Grayscale (Average)');

    subplot(2, 2, 3);
    imshow(grayscale_luminosity, []);
    title('Grayscale (Luminosity)');

    subplot(2, 2, 4);
    imshow(grayscale_desaturation, []);
    title('Grayscale (Desaturation)');

    % Display the images side by side
    disp('Original Image:');
    imshow(original_image);
    title('Original Image');
    
    figure;
    subplot(1, 3, 1);
    imshow(grayscale_average, []);
    title('Grayscale (Average)');

    subplot(1, 3, 2);
    imshow(grayscale_luminosity, []);
    title('Grayscale (Luminosity)');

    subplot(1, 3, 3);
    imshow(grayscale_desaturation, []);
    title('Grayscale (Desaturation)');
end
