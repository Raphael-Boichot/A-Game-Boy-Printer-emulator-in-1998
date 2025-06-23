function GB_pixels = ram_decode(GB_tile, PACKET_image_width, PACKET_image_height)
    % Initialize the output image
    PACKET_image = zeros(PACKET_image_height, PACKET_image_width, 'uint8');

    % Total number of tiles
    num_tiles_x = PACKET_image_width / 8;
    num_tiles_y = PACKET_image_height / 8;
    num_tiles = num_tiles_x * num_tiles_y;

    pos = 1;

    for tile_index = 0 : num_tiles - 1
        % Calculate top-left corner of tile in the image
        tile_row = floor(tile_index / num_tiles_x);
        tile_col = mod(tile_index, num_tiles_x);
        y = tile_row * 8 + 1;
        x = tile_col * 8 + 1;

        tile = zeros(8, 8, 'uint8');

        for i = 1 : 8
            byte1 = GB_tile(pos);
            byte2 = GB_tile(pos + 1);
            pos = pos + 2;

            % Decode 8 pixels from 2 bytes using bit operations
            for j = 1 : 8
                low_bit  = uint8(bitget(byte1, 9 - j));  % LSB
                high_bit = uint8(bitget(byte2, 9 - j));  % MSB
                tile(i, j) = bitor(bitshift(high_bit, 1), low_bit);
            end
        end

        PACKET_image(y:y+7, x:x+7) = tile;
    end

    % Invert grayscale (Game Boy: 0 = white, 3 = black)
    GB_pixels = 3 - PACKET_image;
end

