%By Raphael BOICHOT, fall 2023
%can be run with Matlab or GNU Octave
%place in your data folder to output PNGs
clc
clear

try
    pkg load image % for compatibility with Octave
catch
    % Nothing to do
end

% Set fixed width (Game Boy screen width)
PACKET_image_width = 160;

% Get all .DAT* files
listing = dir('*.DAT*');

for i = 1:length(listing)
    name = listing(i).name;
    fprintf('Processing: %s\n', name);

    % Read file
    fid = fopen(name, 'r');
    a = fread(fid, 'uint8');
    fclose(fid);

    % Total number of tiles (16 bytes per tile)
    tiles = floor(length(a) / 16);

    % Calculate image height in pixels
    % Each row holds (PACKET_image_width / 8) tiles
    PACKET_image_height = 8 * ceil(tiles / (PACKET_image_width / 8));

    % Extract only complete tile data
    GB_tile = a(1 : 16 * tiles);

    % Decode tile image
    frame = ram_decode(GB_tile, PACKET_image_width, PACKET_image_height);

    % Grayscale mapping for display and PNG output
    % Game Boy palette: 0=white, 3=black, here mapping to custom gray levels
    frame_png = uint8( ...
          (frame == 3) * 255 + ...
          (frame == 2) * 125 + ...
          (frame == 1) * 80  + ...
          (frame == 0) * 0);

    % Save as PNG
    imwrite(frame_png, [name(1:end-4), '.png']);
    disp('RAM extracted and image saved.');

    % Display the frame
    figure(1); clf;
    imagesc(frame);
    colormap gray;
    axis image off;
    title(['Frame from ', name]);
    drawnow;
end

