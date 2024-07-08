function image_enhancement_techniques(image_path)
    % Apply different image enhancement techniques and compare their effects
    % image_path: Path to the image file

    % Load the image package
    pkg load image;

    % Read the original image
    original_image = imread(image_path);
    grayscale_image = rgb2gray(original_image);

    % Apply histogram equalization
    equalized_image = histeq(grayscale_image);

    % Apply contrast stretching
    min_value = double(min(grayscale_image(:)));
    max_value = double(max(grayscale_image(:)));
    contrast_stretched_image = imadjust(grayscale_image, [min_value/255; max_value/255], []);

    % Display the original and enhanced images
    figure;

    subplot(2, 2, 1);
    imshow(grayscale_image);
    title('Original Grayscale Image');

    subplot(2, 2, 2);
    imshow(equalized_image);
    title('Histogram Equalization');

    subplot(2, 2, 3);
    imshow(contrast_stretched_image);
    title('Contrast Stretching');

    % Display histograms of the images
    figure;

    subplot(3, 1, 1);
    imhist(grayscale_image);
    title('Histogram of Original Image');

    subplot(3, 1, 2);
    imhist(equalized_image);
    title('Histogram of Equalized Image');

    subplot(3, 1, 3);
    imhist(contrast_stretched_image);
    title('Histogram of Contrast Stretched Image');

    % Discuss the impact of image enhancement techniques
    disp('Impact of image enhancement techniques:');
    disp('1. Histogram Equalization:');
    disp('- Redistributes the intensity values of the image.');
    disp('- Enhances the contrast of the image by spreading out the most frequent intensity values.');
    disp('- Effective for images with backgrounds and foregrounds that are both bright or both dark.');
    disp('2. Contrast Stretching:');
    disp('- Stretches the range of intensity values to span the full range of the display.');
    disp('- Enhances the contrast of the image by utilizing the full intensity range.');
    disp('- Effective for images with a narrow range of intensity values.');
end

image_enhancement_techniques('Z:/AAIT/Computer Vision/images/Mandrill.jpg');
