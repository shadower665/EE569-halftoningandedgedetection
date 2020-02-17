function P_out = error_diffusion(P,filter_size,t,method)
%ERROR_DIFFUSION 此处显示有关此函数的摘要
%   此处显示详细说明
row  = size(P,1);
col = size(P,2);
P_out = zeros(row,col);
P_mid = zeros(row+filter_size-1,col+filter_size-1);

half_size = (filter_size-1)/2;
P_mid(1+half_size:row+half_size,1+half_size:col+half_size)=P;
for i = 1+half_size:row+half_size
    if mod(i+1,2)==1
        for j = 1+half_size:col+half_size
            if P_mid(i,j)<t
                P_out(i-half_size,j-half_size) = 0;
                error = P_mid(i,j);
            else
                P_out(i-half_size,j-half_size) = 255;
                error = P_mid(i,j)-255;
            end
            if filter_size == 3
                P_mid(i,j+1)=P_mid(i,j+1)+7*error/16;
                P_mid(i+1,j-1)=P_mid(i+1,j-1)+3*error/16;
                P_mid(i+1,j)=P_mid(i+1,j)+5*error/16;
                P_mid(i+1,j+1)=P_mid(i+1,j+1)+error/16;
            else
                if filter_size ==5
                    if method ==1
                        P_mid(i,j+1)=P_mid(i,j+1)+7*error/48;
                        P_mid(i,j+2)=P_mid(i,j+2)+5*error/48;
                        P_mid(i+1,j-2)=P_mid(i+1,j-2)+3*error/48;
                        P_mid(i+1,j-1)=P_mid(i+1,j-1)+5*error/48;
                        P_mid(i+1,j)=P_mid(i+1,j)+7*error/48;
                        P_mid(i+1,j+1)=P_mid(i+1,j+1)+5*error/48;
                        P_mid(i+1,j+2)=P_mid(i+1,j+2)+3*error/48;
                        P_mid(i+2,j-2)=P_mid(i+2,j-2)+error/48;
                        P_mid(i+2,j-1)=P_mid(i+2,j-1)+3*error/48;
                        P_mid(i+2,j)=P_mid(i+2,j)+5*error/48;
                        P_mid(i+2,j+1)=P_mid(i+2,j+1)+3*error/48;
                        P_mid(i+2,j+2)=P_mid(i+2,j+2)+3*error/48;
                    else
                        if method ==2
                            P_mid(i,j+1)=P_mid(i,j+1)+8*error/48;
                            P_mid(i,j+2)=P_mid(i,j+2)+4*error/48;
                            P_mid(i+1,j-2)=P_mid(i+1,j-2)+2*error/48;
                            P_mid(i+1,j-1)=P_mid(i+1,j-1)+4*error/48;
                            P_mid(i+1,j)=P_mid(i+1,j)+8*error/48;
                            P_mid(i+1,j+1)=P_mid(i+1,j+1)+4*error/48;
                            P_mid(i+1,j+2)=P_mid(i+1,j+2)+2*error/48;
                            P_mid(i+2,j-2)=P_mid(i+2,j-2)+error/48;
                            P_mid(i+2,j-1)=P_mid(i+2,j-1)+2*error/48;
                            P_mid(i+2,j)=P_mid(i+2,j)+4*error/48;
                            P_mid(i+2,j+1)=P_mid(i+2,j+1)+2*error/48;
                            P_mid(i+2,j+2)=P_mid(i+2,j+2)+error/48;
                        end
                    end
                 end
            end
        end
    else
    for j = col+half_size:-1:half_size+1
            if P_mid(i,j)<t
                P_out(i-half_size,j-half_size) = 0;
                error = P_mid(i,j);
            else
                P_out(i-half_size,j-half_size) = 255;
                error = P_mid(i,j)-255;
            end
            if filter_size == 3
                P_mid(i,j+1)=P_mid(i,j+1)+7*error/16;
                P_mid(i+1,j-1)=P_mid(i+1,j-1)+3*error/16;
                P_mid(i+1,j)=P_mid(i+1,j)+5*error/16;
                P_mid(i+1,j+1)=P_mid(i+1,j+1)+error/16;
            else
                if filter_size ==5
                   if method ==1
                        P_mid(i,j+1)=P_mid(i,j+1)+7*error/48;
                        P_mid(i,j+2)=P_mid(i,j+2)+5*error/48;
                        P_mid(i+1,j-2)=P_mid(i+1,j-2)+3*error/48;
                        P_mid(i+1,j-1)=P_mid(i+1,j-1)+5*error/48;
                        P_mid(i+1,j)=P_mid(i+1,j)+7*error/48;
                        P_mid(i+1,j+1)=P_mid(i+1,j+1)+5*error/48;
                        P_mid(i+1,j+2)=P_mid(i+1,j+2)+3*error/48;
                        P_mid(i+2,j-2)=P_mid(i+2,j-2)+error/48;
                        P_mid(i+2,j-1)=P_mid(i+2,j-1)+3*error/48;
                        P_mid(i+2,j)=P_mid(i+2,j)+5*error/48;
                        P_mid(i+2,j+1)=P_mid(i+2,j+1)+3*error/48;
                        P_mid(i+2,j+2)=P_mid(i+2,j+2)+3*error/48;
                    else
                        if method ==2
                            P_mid(i,j+1)=P_mid(i,j+1)+8*error/48;
                            P_mid(i,j+2)=P_mid(i,j+2)+4*error/48;
                            P_mid(i+1,j-2)=P_mid(i+1,j-2)+2*error/48;
                            P_mid(i+1,j-1)=P_mid(i+1,j-1)+4*error/48;
                            P_mid(i+1,j)=P_mid(i+1,j)+8*error/48;
                            P_mid(i+1,j+1)=P_mid(i+1,j+1)+4*error/48;
                            P_mid(i+1,j+2)=P_mid(i+1,j+2)+2*error/48;
                            P_mid(i+2,j-2)=P_mid(i+2,j-2)+error/48;
                            P_mid(i+2,j-1)=P_mid(i+2,j-1)+2*error/48;
                            P_mid(i+2,j)=P_mid(i+2,j)+4*error/48;
                            P_mid(i+2,j+1)=P_mid(i+2,j+1)+2*error/48;
                            P_mid(i+2,j+2)=P_mid(i+2,j+2)+error/48;
                        end
                    end
                 end
            end
    end
    end

end

