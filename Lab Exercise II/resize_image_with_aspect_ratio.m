function resize_image_with_aspect_ratio(image_path, target_width, target_height)
    % Resize an image to specified dimensions while maintaining aspect ratio.
    % image_path: Path to the image file
    % target_width: Desired width of the resized image
    % target_height: Desired height of the resized image

    % Load the image package
    pkg load image;

    % Read the original image
    original_image = imread(image_path);
    [original_height, original_width, num_channels] = size(original_image);

    % Calculate aspect ratio
    aspect_ratio = original_width / original_height;

    % Determine the new dimensions
    if (target_width / target_height) > aspect_ratio
        new_height = target_height;
        new_width = round(new_height * aspect_ratio);
    else
        new_width = target_width;
        new_height = round(new_width / aspect_ratio);
    end

    % Resize the image
    resized_image = imresize(original_image, [new_height, new_width]);

    % Display the original and resized images
    figure;
    subplot(1, 2, 1);
    imshow(original_image);
    title('Original Image');
    xlabel(sprintf('Resolution: %dx%d', original_width, original_height));

    subplot(1, 2, 2);
    imshow(resized_image);
    title('Resized Image');
    xlabel(sprintf('Resolution: %dx%d', new_width, new_height));
    
    % Compare image quality and resolution
    disp('Original Image:');
    fprintf('Resolution: %dx%d\n', original_width, original_height);
    fprintf('Aspect Ratio: %.2f\n', aspect_ratio);
    
    disp('Resized Image:');
    fprintf('Resolution: %dx%d\n', new_width, new_height);
    fprintf('Aspect Ratio: %.2f\n', new_width / new_height);
end
