function count = writeraw(G, filename,dimension)
%writeraw - write RAW format grey scale image file 
% Usage :	writeraw(G, filename)
% G:		input image matrix
% filename: file name of the file to write to disk
% count:	return value, the elements written to file

	disp([' Write image data to'  filename ' ...']);
    G = permute(G,[2 1 3]);
	% Get file ID
	fid = fopen(filename,'wb');
    row = size(G,1);
    col = size(G,2);
    Size = (row*col);
	% Check if file exists
	if (fid == -1)
		error('can not open output image filem press CTRL-C to exit \n');
		pause
    end
    
	% Transpose matrix to write file properly
  pixels = zeros(row,col,dimension);
  for i = 1:dimension
      pixels(i:dimension:Size*dimension)=G(1+Size*(i-1):Size*i);
  end
      
       % G = permute(G,[2,1,3]); 
    

	% Write and close file
	count = fwrite(fid,pixels, 'uchar');
	fclose(fid);

	% Transpose again to restore matrix
	%G = permute(G,[2,1,3]);
end %function