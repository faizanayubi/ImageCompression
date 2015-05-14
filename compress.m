%%%%%%%%% START %%%%%%%
clc
close all
im=imread('a.bmp');
im = double(im)/255;
im = rgb2gray(im);
subplot(211)

imshow(im)
title('Original image');
img_dct=dct2(im);
img_pow=(img_dct).^2;
img_pow=img_pow(:);
[B,index]=sort(img_pow);%no zig-zag
B=flipud(B);
index=flipud(index);
compressed_dct=zeros(size(im));
coeff = 20000;

% maybe change the value
for k=1:coeff
compressed_dct(index(k))=img_dct(index(k));
end
im_dct=idct2(compressed_dct);
subplot(212)
imshow(im_dct)
title('DCT Compress Image');

% for saving this image use "imwrite" command 
imwrite(im_dct, 'compress.bmp')

%%%%%%%% END %%%%%%%
