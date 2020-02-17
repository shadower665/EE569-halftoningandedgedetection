function P_out = threshold_sobel(P,T)
%THRESHOLD_SOBEL 此处显示有关此函数的摘要
%   此处显示详细说明
row = size(P,1);
col = size(P,2);
P_out = zeros(row,col);
for i = 1:row
    for j = 1:col
        if P(i,j)<T
            P_out(i,j) = 0;
        else
            P_out(i,j) = 1;
        end
    end
end
end

