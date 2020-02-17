function P_hf = halftoning_dither(P,index)
%HALFTONING_ 此处显示有关此函数的摘要
%   此处显示详细说明
row = size(P,1);
col = size(P,2);
P_hf = zeros(row,col);
index_size = size(index,1);
index = (index+0.5).*(255/index_size^2);
for i =1:row
    for j = 1:col
        
        if P(i,j)<=index(mod(i-1,index_size)+1,mod(j-1,index_size)+1)
            P_hf(i,j) = 0;
        else
            P_hf(i,j) = 255;
        end
    end
end
            
            
end

