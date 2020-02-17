function P_ht = halftoning(P,t)
%HALFTONING 此处显示有关此函数的摘要
%   此处显示详细说明
row = size(P,1);
col = size(P,2);
P_ht = zeros(row,col);
for i =1:row
    for j =1:col
        if P(i,j)<t
            P_ht(i,j) = 0;
        else
            P_ht(i,j) = 255;
        end
    end
end
end

