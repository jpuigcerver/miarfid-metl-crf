function F = ExtractImageFeatures( I )
%FEATUREEXTRACTION Extract image features.
%   I: Binary inverted image (0 -> white, 1 -> black)
%   The image must be preprocessed before this step (slant, skew and crop).
[H, W] = size(I);
R = W / H;
A = W * H;

%F=zeros(27, 1);
F=zeros(25, 1);
% Scalar features
F(1) = H; % Height
F(2) = W; % Width
F(3) = R; % Ration W/H
F(4) = A; % Area W*H
%F(5) = 0; % Number of ascenders
%F(6) = 0; % Number of descenders

% Profile-based features
[P, L, U]=ExtractImageProfiles(I);
ProfFFT = [fft(P, 4); fft(L, 4); fft(U, 4)];
RealFFT = real(ProfFFT)
ImagFFT = imag(ProfFFT)
F(5:16) = RealFFT;
F(17:25) = [ImagFFT(2:4); ImagFFT(6:8); ImagFFT(10:12)];
end
