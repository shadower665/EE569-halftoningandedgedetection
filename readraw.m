function G = readraw(filename,row,col,times)
%readraw - read RAW format grey scale image of square size into matrix G
% Usage:	G = readraw(filename)

	disp(['	Retrieving Image ' filename ' ...']);

	% Get file ID for file
	fid=fopen(filename,'rb');

	% Check if file exists
	if (fid == -1)
	  	error('can not open input image file press CTRL-C to exit \n');
	  	pause
	end

	% Get all the pixels from the image
	pixel = fread(fid, inf, 'uchar');

	% Close file
	fclose(fid);
	% Calculate length/width, assuming image is square
	[Y X]=size(pixel);
	%Size=(Y*X);
    
    Size = (row*col);
	%N=sqrt(Size);
    %N = ceil(N);
	% Construct matrix
	G = zeros(row,col,times);
    %%G = reshape(pixel,[row col]);
	% Write pixels into matrix
    for i = 1:times
	G(1+Size*(i-1):Size*i) = pixel(i:times:Size*times);
    
    end
	% Transpose matrix, to orient it properly
	G = permute(G,[2 1 3]);
end %function
