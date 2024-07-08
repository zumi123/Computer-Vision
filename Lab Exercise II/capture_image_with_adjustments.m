global brightness;
global contrast;
brightness = 0;
contrast = 0;

function capture_image_with_adjustments()
    % Capture images from a connected camera device with adjustable parameters
    % Allows users to adjust brightness and contrast before capturing the image

    % Ensure ffmpeg is installed and in the system PATH

    % Load the necessary packages
    pkg load image;

    % Create a figure for control sliders
    h = figure('Name', 'Camera Capture with Adjustments', 'NumberTitle', 'off');
    
    % Add a button to capture the image
    uicontrol('Style', 'pushbutton', 'String', 'Capture Image', 'Position', [10, 10, 120, 40], 'Callback', @capture_callback);

    % Add sliders for brightness and contrast
    uicontrol('Style', 'text', 'String', 'Brightness', 'Position', [10, 60, 100, 20]);
    h_brightness = uicontrol('Style', 'slider', 'Min', -1, 'Max', 1, 'Value', 0, 'Position', [120, 60, 200, 20], 'Callback', @adjust_brightness);

    uicontrol('Style', 'text', 'String', 'Contrast', 'Position', [10, 90, 100, 20]);
    h_contrast = uicontrol('Style', 'slider', 'Min', -1, 'Max', 1, 'Value', 0, 'Position', [120, 90, 200, 20], 'Callback', @adjust_contrast);

    % Loop to continuously update the preview with adjusted brightness and contrast
    while ishandle(h)
        % Capture a frame using ffmpeg
        system('ffmpeg -y -f dshow -i video="Integrated Camera" -frames:v 1 captured_frame.png');

        % Read the captured frame
        img = imread('captured_frame.png');

        % Adjust brightness and contrast
        img = imadjust(img, stretchlim(img), [], contrast);
        img = im2double(img) + brightness;
        img = im2uint8(img);

        % Display the adjusted image
        subplot(1, 2, 1);
        imshow(img);
        title('Live Preview');

        drawnow;
    end
end

% Callback function for capturing the image
function capture_callback(~, ~)
    % Save the current frame
    system('ffmpeg -y -f dshow -i video="Integrated Camera" -frames:v 1 captured_image.png');
    fprintf('Image captured and saved as captured_image.png\n');
end

% Callback function for adjusting brightness
function adjust_brightness(hObject, ~)
    global brightness;
    brightness = get(hObject, 'Value');
end

% Callback function for adjusting contrast
function adjust_contrast(hObject, ~)
    global contrast;
    contrast = get(hObject, 'Value');
end

capture_image_with_adjustments();
