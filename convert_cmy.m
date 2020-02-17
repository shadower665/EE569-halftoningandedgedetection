function P_cmy = convert_cmy(P)
%CONVERT_CMY 此处显示有关此函数的摘要
%   此处显示详细说明
row = size(P,1);
col = size(P,2);
P_cmy = zeros(row,col,3);
for i =1:row
    for j =1:col
        P_cmy(i,j,1) = 255-P(i,j,1);
        P_cmy(i,j,2) = 255-P(i,j,2);
        P_cmy(i,j,3) = 255-P(i,j,3);
    end
end
end

