function color_space_conversion_and_processing(image_path)
    % Convert images to different color spaces and observe effects on edge detection and segmentation
    % image_path: Path to the image file

    % Load the image package
    pkg load image;

    % Read the original image
    original_image = imread(image_path);

    % Convert to grayscale
    grayscale_image = rgb2gray(original_image);

    % Convert to HSV
    hsv_image = rgb2hsv(original_image);

    % Perform edge detection
    edges_rgb = edge(rgb2gray(original_image), 'Canny');
    edges_gray = edge(grayscale_image, 'Canny');
    edges_hsv = edge(hsv_image(:, :, 3), 'Canny');  % Using the V (Value) channel for edge detection

    % Perform segmentation using simple thresholding
    threshold_rgb = graythresh(rgb2gray(original_image));
    segmented_rgb = im2bw(rgb2gray(original_image), threshold_rgb);

    threshold_gray = graythresh(grayscale_image);
    segmented_gray = im2bw(grayscale_image, threshold_gray);

    threshold_hsv = graythresh(hsv_image(:, :, 3));
    segmented_hsv = im2bw(hsv_image(:, :, 3), threshold_hsv);

    % Display original and processed images
    figure;

    subplot(3, 3, 1);
    imshow(original_image);
    title('Original Image (RGB)');

    subplot(3, 3, 2);
    imshow(grayscale_image);
    title('Grayscale Image');

    subplot(3, 3, 3);
    imshow(hsv_image);
    title('HSV Image');

    subplot(3, 3, 4);
    imshow(edges_rgb);
    title('Edges (RGB)');

    subplot(3, 3, 5);
    imshow(edges_gray);
    title('Edges (Grayscale)');

    subplot(3, 3, 6);
    imshow(edges_hsv);
    title('Edges (HSV - V Channel)');

    subplot(3, 3, 7);
    imshow(segmented_rgb);
    title('Segmentation (RGB)');

    subplot(3, 3, 8);
    imshow(segmented_gray);
    title('Segmentation (Grayscale)');

    subplot(3, 3, 9);
    imshow(segmented_hsv);
    title('Segmentation (HSV - V Channel)');

    % Discuss the impact of color spaces on image processing tasks
    disp('Impact of color spaces on image processing tasks:');
    disp('1. Edge Detection:');
    disp('- Edge detection on RGB images uses grayscale conversion internally, which may not utilize color information effectively.');
    disp('- Grayscale edge detection is straightforward and often sufficient for many tasks.');
    disp('- HSV edge detection using the V channel can highlight edges based on intensity, but may lose color information.');
    disp('2. Segmentation:');
    disp('- Segmentation on RGB images often relies on converting to grayscale, which discards color information.');
    disp('- Grayscale segmentation is simple and efficient but may not capture color-based segment boundaries.');
    disp('- HSV segmentation using the V channel can effectively segment based on intensity differences.');
    disp('- Using different channels in HSV can provide more flexibility for color-based segmentation.');
end

color_space_conversion_and_processing('Z:/AAIT/Computer Vision/images/Mandrill.jpg');
