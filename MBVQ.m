function P_out = MBVQ(P)
%MBVQ 此处显示有关此函数的摘要
%   此处显示详细说明
row = size(P,1);
col = size(P,2);
P_mid = zeros(row+2,col+2,3);
P_mid(2:row+1,2:col+1,:)=P;
P_out = zeros(row,col,3);
error = zeros(3);
for i = 2:row+1
    for j = 2:col+1
        mbvqspace = mbvq_space(P_mid(i,j,1),P_mid(i,j,2),P_mid(i,j,3));
        vertex = getNearestVertex(mbvqspace,P_mid(i,j,1)/255,P_mid(i,j,2)/255,P_mid(i,j,3)/255);
        
        if strcmp(vertex,'white')
            P_out(i-1,j-1,1) =255;
            P_out(i-1,j-1,2) =255;
            P_out(i-1,j-1,3) =255;
        end
        if strcmp(vertex,'red')
            P_out(i-1,j-1,1) =255;
            P_out(i-1,j-1,2) =0;
            P_out(i-1,j-1,3) =0;
        end
        if strcmp(vertex,'green')
            P_out(i-1,j-1,1) =0;
            P_out(i-1,j-1,2) =255;
            P_out(i-1,j-1,3) =0;
        end
        if strcmp(vertex,'blue')
            P_out(i-1,j-1,1) =0;
            P_out(i-1,j-1,2) =0;
            P_out(i-1,j-1,3) =255;
        end
        if strcmp(vertex,'cyan')
            P_out(i-1,j-1,1) =0;
            P_out(i-1,j-1,2) =255;
            P_out(i-1,j-1,3) =255;
        end
        if strcmp(vertex,'yellow')
            P_out(i-1,j-1,1) =255;
            P_out(i-1,j-1,2) =255;
            P_out(i-1,j-1,3) =0;
        end
        if strcmp(vertex,'magenta')
            P_out(i-1,j-1,1) =255;
            P_out(i-1,j-1,2) =0;
            P_out(i-1,j-1,3) =255;
        end
        if strcmp(vertex,'black')
            P_out(i-1,j-1,1) =0;
            P_out(i-1,j-1,2) =0;
            P_out(i-1,j-1,3) =0;
        end
        error(1) = P_mid(i,j,1)-P_out(i-1,j-1,1);
        error(2) = P_mid(i,j,2)-P_out(i-1,j-1,2);
        error(3) = P_mid(i,j,3)-P_out(i-1,j-1,3);
        for k =1:3
            P_mid(i,j+1,k)=P_mid(i,j+1,k)+7*error(k)/16;
            P_mid(i+1,j-1,k)=P_mid(i+1,j-1,k)+3*error(k)/16;
            P_mid(i+1,j,k)=P_mid(i+1,j,k)+5*error(k)/16;
            P_mid(i+1,j+1,k)=P_mid(i+1,j+1,k)+error(k)/16;
        end
            
    end
end

end

