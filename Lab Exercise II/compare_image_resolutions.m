function compare_image_resolutions(image_path)
    % Compare images of different resolutions and analyze their impact
    % image_path: Path to the image file

    % Load the image package
    pkg load image;

    % Read the original image
    original_image = imread(image_path);

    % Define different resolutions
    resolutions = [256, 512, 1024];
    images = cell(length(resolutions), 1);

    % Resize image to different resolutions
    for i = 1:length(resolutions)
        images{i} = imresize(original_image, [resolutions(i), resolutions(i)]);
    end

    % Perform image processing tasks
    edge_detected_images = cell(length(resolutions), 1);
    blurred_images = cell(length(resolutions), 1);

    % Measure processing time for each resolution
    edge_times = zeros(length(resolutions), 1);
    blur_times = zeros(length(resolutions), 1);

    for i = 1:length(resolutions)
        % Edge detection
        tic;
        edge_detected_images{i} = edge(rgb2gray(images{i}), 'Canny');
        edge_times(i) = toc;

        % Gaussian blurring
        tic;
        h = fspecial('gaussian', [5 5], 2);
        blurred_images{i} = imfilter(images{i}, h);
        blur_times(i) = toc;
    end

    % Display original and processed images
    figure;

    for i = 1:length(resolutions)
        subplot(3, length(resolutions), i);
        imshow(images{i});
        title(sprintf('%dx%d Resolution', resolutions(i), resolutions(i)));

        subplot(3, length(resolutions), i + length(resolutions));
        imshow(edge_detected_images{i});
        title(sprintf('Edges (%dx%d)', resolutions(i), resolutions(i)));

        subplot(3, length(resolutions), i + 2 * length(resolutions));
        imshow(blurred_images{i});
        title(sprintf('Blurred (%dx%d)', resolutions(i), resolutions(i)));
    end

    % Display processing times
    fprintf('Processing times for edge detection:\n');
    for i = 1:length(resolutions)
        fprintf('%dx%d: %.4f seconds\n', resolutions(i), resolutions(i), edge_times(i));
    end

    fprintf('Processing times for Gaussian blurring:\n');
    for i = 1:length(resolutions)
        fprintf('%dx%d: %.4f seconds\n', resolutions(i), resolutions(i), blur_times(i));
    end

    % Discuss the impact of resolution on processing speed and quality
    disp('Impact of resolution on image processing tasks:');
    disp('1. Processing Speed:');
    disp('- Higher resolution images require more processing time for tasks like edge detection and Gaussian blurring.');
    disp('- As resolution increases, the number of pixels to be processed increases quadratically, leading to longer processing times.');
    disp('2. Quality:');
    disp('- Higher resolution images provide more detail and better quality for image processing tasks.');
    disp('- Edge detection results are more accurate and less prone to aliasing at higher resolutions.');
    disp('- Gaussian blurring appears smoother and more natural at higher resolutions.');
    disp('3. Trade-offs:');
    disp('- There is a trade-off between processing speed and image quality.');
    disp('- Lower resolution images are processed faster but may lose important details.');
    disp('- Higher resolution images provide better quality but require more computational resources and time.');
end

compare_image_resolutions('Z:/AAIT/Computer Vision/images/Mandrill.jpg');
