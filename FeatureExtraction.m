function FeatureExtraction( dimg )

% Extract continuous features
lst = dir([dimg, '/*.png']);
F = zeros(size(lst, 1), 25);
for f=1:size(lst,1)
    fname=lst(f).name;
    I = imread([dimg, '/', fname]);
    I = ImageCrop(1 - I);
    F(f,:) = ExtractImageFeatures(I);
end

% Binarize features using different number of bins
F=[BinarizeFeatures(F, 9) BinarizeFeatures(F, 10)];

% Write features to file, followed by the filename
fid = fopen('features.dat', 'wt');
for f=1:size(lst,1)
    fname = lst(f).name;
    for j=F(f,:)
        fprintf(fid, '%d ', j);
    end
    fprintf(fid, '%s\n', fname);
end
fclose(fid);

end

