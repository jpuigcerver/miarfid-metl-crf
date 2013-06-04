function IC = ImageCrop(I)
%IMGCROP Crops a binary inverted image
% I: Binary inverted image (0 -> white, 1 -> black)
Sc = sum(I,1);
Sr = sum(I,2);
NonEmptyCols = find(Sc ~= 0);
NonEmptyRows = find(Sr ~= 0);
row0=NonEmptyRows(1);
row1=NonEmptyRows(end);
col0=NonEmptyCols(1);
col1=NonEmptyCols(end);
IC = I(row0:row1,col0:col1);
end