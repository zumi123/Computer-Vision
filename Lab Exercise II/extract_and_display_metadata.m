function extract_and_display_metadata(image_path)
    % Extract and display metadata from an image
    % image_path: Path to the image file

    % Load the necessary package
    pkg load image;

    % Extract metadata using imfinfo
    info = imfinfo(image_path);

    % Display metadata
    fprintf('Metadata for image: %s\n', image_path);
    fprintf('Filename: %s\n', info.Filename);
    fprintf('File size: %d bytes\n', info.FileSize);
    fprintf('Format: %s\n', info.Format);
    fprintf('Format version: %s\n', info.FormatVersion);
    fprintf('Width: %d pixels\n', info.Width);
    fprintf('Height: %d pixels\n', info.Height);
    fprintf('Bit depth: %d\n', info.BitDepth);
    fprintf('Color type: %s\n', info.ColorType);

    % Check for additional metadata fields and display if present
    if isfield(info, 'DateTime')
        fprintf('Creation date: %s\n', info.DateTime);
    end
    if isfield(info, 'ResolutionUnit')
        fprintf('Resolution unit: %s\n', info.ResolutionUnit);
    end
    if isfield(info, 'XResolution')
        fprintf('X resolution: %d\n', info.XResolution);
    end
    if isfield(info, 'YResolution')
        fprintf('Y resolution: %d\n', info.YResolution);
    end
    if isfield(info, 'Make')
        fprintf('Camera make: %s\n', info.Make);
    end
    if isfield(info, 'Model')
        fprintf('Camera model: %s\n', info.Model);
    end
    if isfield(info, 'Software')
        fprintf('Software: %s\n', info.Software);
    end
    if isfield(info, 'DigitalCamera')
        fprintf('Camera properties:\n');
        disp(info.DigitalCamera);
    end

    % Display the image
    img = imread(image_path);
    figure;
    imshow(img);
    title('Loaded Image');
end

extract_and_display_metadata('Z:\AAIT\Computer Vision\images/Mandrill.jpg');
