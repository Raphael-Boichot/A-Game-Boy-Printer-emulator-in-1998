% Fixed screen width (Game Boy default)
PACKET_image_width = 160;

% List all .DAT* files in the current folder
listing = dir('*.DAT*');

% Process each file
for i = 1:length(listing)
    name = listing(i).name;
    fprintf('Processing: %s\n', name);

    % Read binary data
    fid = fopen(name, 'r');
    if fid == -1
        warning('Failed to open file: %s', name);
        continue;
    end
    a = fread(fid, 'uint8');
    fclose(fid);

    % Calculate total number of complete tiles (each is 16 bytes)
    tiles = floor(length(a) / 16);

    if tiles == 0
        warning('No complete tiles found in %s, skipping.', name);
        continue;
    end

    % Calculate image height in pixels
    tiles_per_row = PACKET_image_width / 8;
    PACKET_image_height = 8 * ceil(tiles / tiles_per_row);

    % Extract only valid tile data
    GB_tile = a(1 : 16 * tiles);

    % Decode image from tile data
    try
        frame = ram_decode(GB_tile, PACKET_image_width, PACKET_image_height);
    catch err
        warning('Failed to decode %s: %s', name, err.message);
        continue;
    end

    % Map pixel values to grayscale for image output
    frame_png = uint8((frame == 3) * 255 + ...
                      (frame == 2) * 125 + ...
                      (frame == 1) * 80  + ...
                      (frame == 0) * 0);

    % Save image as PNG
    output_name = [name(1:end-4), '.png'];
    imwrite(frame_png, output_name);
    fprintf('Saved: %s\n', output_name);

    % Optional: Display image
    figure(1); clf;
    imagesc(frame);
    colormap gray;
    axis image off;
    title(['Preview: ', name], 'Interpreter', 'none');
    drawnow;
end

disp('All files processed.');

