function load_and_display_color_spaces(image_path)
    % Load and display images in different color spaces (RGB, CMYK)
    % image_path: Path to the image file

    % Load the image package
    pkg load image;

    % Read the original image in RGB
    rgb_image = imread(image_path);

    % Convert RGB to CMYK (approximated conversion for demonstration purposes)
    cmyk_image = rgb2cmyk(rgb_image);

    % Display the RGB and CMYK images
    figure;
    
    subplot(2, 2, 1);
    imshow(rgb_image);
    title('RGB Image');

    % Display the individual CMYK channels
    subplot(2, 2, 2);
    imshow(cmyk_image(:, :, 1));
    title('Cyan Channel');

    subplot(2, 2, 3);
    imshow(cmyk_image(:, :, 2));
    title('Magenta Channel');

    subplot(2, 2, 4);
    imshow(cmyk_image(:, :, 3));
    title('Yellow Channel');
    
    figure;
    imshow(cmyk_image(:, :, 4));
    title('Black Channel');

    % Convert CMYK back to RGB to show the effect
    rgb_from_cmyk = cmyk2rgb(cmyk_image);

    % Display the RGB image obtained from CMYK
    figure;
    imshow(rgb_from_cmyk);
    title('RGB Image from CMYK');
end

function cmyk = rgb2cmyk(rgb)
    % Approximate conversion from RGB to CMYK
    rgb = im2double(rgb);
    K = 1 - max(rgb, [], 3);
    C = (1 - rgb(:, :, 1) - K) ./ (1 - K + eps);
    M = (1 - rgb(:, :, 2) - K) ./ (1 - K + eps);
    Y = (1 - rgb(:, :, 3) - K) ./ (1 - K + eps);
    cmyk = cat(3, C, M, Y, K);
end

function rgb = cmyk2rgb(cmyk)
    % Approximate conversion from CMYK to RGB
    C = cmyk(:, :, 1);
    M = cmyk(:, :, 2);
    Y = cmyk(:, :, 3);
    K = cmyk(:, :, 4);
    R = (1 - C) .* (1 - K);
    G = (1 - M) .* (1 - K);
    B = (1 - Y) .* (1 - K);
    rgb = cat(3, R, G, B);
    rgb = im2uint8(rgb);
end

load_and_display_color_spaces('Z:\AAIT\Computer Vision\images/Mandrill.jpg');
