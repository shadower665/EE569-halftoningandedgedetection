function J = convolution(Original_p,filter)
%CONVOLUTION 此处显示有关此函数的摘要
%   此处显示详细说明
    row = size(Original_p,1);
    col = size(Original_p,2);
    filtersize = size(filter,1);
    halfsize1 = (filtersize-1)/2;
    halfsize2 = filtersize-1-halfsize1;
    padded_p = zeros(row+filtersize-1,col+filtersize-1);
    padded_p(1+halfsize1:end-halfsize2,1+halfsize1:end-halfsize2) = Original_p;
    J = zeros(row,col);
    for i = 1:row
        for j = 1:col
            for x = 1:filtersize
                for y = 1:filtersize
                    J(i,j) =J(i,j)+padded_p(i-1+x,j-1+y)*filter(x,y);
                end
            end
        end
    end
end

