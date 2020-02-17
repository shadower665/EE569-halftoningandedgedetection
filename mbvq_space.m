function space = mbvq_space(R,G,B)
%MBVQ_SPACE 此处显示有关此函数的摘要
%   此处显示详细说明
if R+G>255
    if G+B>255
        if R+G+B>510
            space = 'CMYW';
        else
            space = 'MYGC';
        end
    else
        space = 'RGMY';
    end
else
    if G+B<=255
        if R+G+B<=255
            space = 'KRGB';
        else
            space = 'RGBM';
        end
    else
        space = 'CMGB';
    end
end
end

