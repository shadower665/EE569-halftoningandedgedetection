%EE569 HOMEWORK ASSGINMENT #2
%Date: 2020/02/16
%Name: Shen Zhihong
%ID: 3645974217
%email: shenzhih@usc.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Problem1: Edge Detection
%Implementation1: sobeledgedetection
%Outputimage:gallery_x.raw,gallery_y.raw,dog_x.raw,dog_y.raw,gallery_e.raw,
%dog_e.raw
%Implementation2:Cannyedgedetection
%OutputImage:gallery_e_c.raw, dog_e_c.raw
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Problem2:Halftoning
%Implementation:fixed
%OutputImage:halft_fixed.raw
%Implementation:random threshold
%OutputImage:halft_random.raw
%Implementation:dithering
%OutputImage: halft_dither1.raw,halft_dither2.raw,halft_dither3.raw
%Implementation:Error diffusion
%OutputImage:color_error_mbvq.raw,color_error_sepa.raw//halft_ed1.raw,halft_ed2.raw,halft_ed_stucki.raw
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Problem1(a)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
D = readraw('Dogs.raw',481,321,3);
D_g = convert_gray(D,321,481);
figure(1);
imshow(D_g/255);
G = readraw('Gallery.raw',481,321,3);
G_g = convert_gray(G,321,481);
G_g = G_g/255;
D_g = D_g/255;
figure(2);
imshow(G_g);
sobel_filter_x =[-1,0,1;-2,0,2;-1,0,1];
sobel_filter_y =[-1,-2,-1;0,0,0;1,2,1];
G_gx = convolution(G_g,sobel_filter_x);
G_gy = convolution(G_g,sobel_filter_y);
D_gx = convolution(D_g,sobel_filter_x);
D_gy = convolution(D_g,sobel_filter_y);
writeraw(G_gx,'gallery_x.raw',1);
writeraw(G_gy,'gallery_y.raw',1);
writeraw(D_gx,'dog_x.raw',1);
writeraw(D_gy,'dog_y.raw',1);
G_edge = sqrt(G_gx.^2+G_gy.^2);
D_edge = sqrt(D_gx.^2+D_gy.^2);
norm_D = max(max(D_edge));
norm = max(max(G_edge));
G_edge = G_edge/norm;
D_edge = D_edge/norm_D;

figure(3);
imshow(G_gx);
imshow(D_gx);
figure(4);
imshow(G_gy);
imshow(D_gy);
figure(5);
G_edge =1-threshold_sobel(G_edge,0.15);
D_edge =1-threshold_sobel(D_edge,0.2);
imshow(G_edge);
figure(6);
imshow(D_edge);
writeraw(D_edge,'dog_e.raw',1);
writeraw(G_edge,'gallery_e.raw',1);
save ('G_edge','G_edge');
save ('D_edge','D_edge');
G_edge_c = 1-edge(G_g,'Canny',[0.12,0.3]);
figure(6);
imshow(G_edge_c);
G_edge_c1= 1-edge(G_g,'Canny',[0.08 0.2]);
G_edge_c2 = 1-edge(G_g,'Canny',[0.05 0.1]);
figure(7);
imshow(G_edge_c1);
figure(8);
imshow(G_edge_c2);
save ('G_edge_c1','G_edge_c1');
writeraw(G_edge_c1,'gallery_e_c.raw',1);

D_edge_c = 1-edge(D_g,'Canny',[0.16,0.4]);
figure(6);
imshow(D_edge_c);
D_edge_c1= 1-edge(D_g,'Canny',[0.08 0.2]);
D_edge_c2 = 1-edge(D_g,'Canny',[0.12 0.3]);
figure(7);
imshow(D_edge_c1);
figure(8);
imshow(D_edge_c2);
save ('D_edge_c','D_edge_c');
writeraw(D_edge_c,'dog_e_c.raw',1);
LH = readraw('LightHouse.raw',750,500,1);
%LH = LH/255;
figure(9);
imshow(LH/255);
LH_ht = halftoning(LH,128);
writeraw(LH_ht,'halft_fixed.raw',1);
figure(10);
imshow(LH_ht/255);
LH_htr = halftoning_random(LH);
figure(11);
imshow(LH_htr/255);
writeraw(LH_htr,'halft_random.raw',1);
filter1 = [1,2;3,0];

filter2 = [4*filter1+1,4*filter1+2;4*filter1+3,4*filter1];
filter3 = [4*filter2+1,4*filter2+2;4*filter2+3,4*filter2];
LH_htd1 = halftoning_dither(LH,filter1);
LH_htd2 = halftoning_dither(LH,filter2);
LH_htd3 = halftoning_dither(LH,filter3);
figure(12);
imshow(LH_htd1/255);
writeraw(LH_htd1,'halft_dither1.raw',1);
writeraw(LH_htd2,'halft_dither2.raw',1);
writeraw(LH_htd3,'halft_dither3.raw',1);
LH_ed1 = error_diffusion(LH,3,128,1);
figure(13);
imshow(LH_ed1/255);
writeraw(LH_ed1,'halft_ed1.raw',1);
figure(14);
LH_ed2 = error_diffusion(LH,5,128,1);
imshow(LH_ed2/255);
writeraw(LH_ed2,'halft_ed2.raw',1);
figure(15);
LH_ed_stucki = error_diffusion(LH,5,128,2);
imshow(LH_ed_stucki/255);
writeraw(LH_ed_stucki,'halft_ed_stucki.raw',1);

R = readraw('Rose.raw',640,480,3);

figure(16);
imshow(R/255);
R_cmy = convert_cmy(R);
figure(17);
imshow(R_cmy/255);
R_cmy_c = error_diffusion(R_cmy(:,:,1),3,128,1);
R_cmy_m = error_diffusion(R_cmy(:,:,2),3,128,1);
R_cmy_y = error_diffusion(R_cmy(:,:,3),3,128,1);
R_cmy_ed = zeros(480,640,3);
R_cmy_ed(:,:,1) =R_cmy_c;
R_cmy_ed(:,:,2) =R_cmy_m;
R_cmy_ed(:,:,3) =R_cmy_y;
figure(18);
R_cmy_ed = 1-R_cmy_ed;
imshow(R_cmy_ed);
writeraw(R_cmy_ed,'color_error_sepa.raw',1);
R_mbvq  =MBVQ(R);
figure(19);
imshow(R_mbvq/255);
writeraw(R_mbvq,'color_error_mbvq.raw',1);
% 
% 
