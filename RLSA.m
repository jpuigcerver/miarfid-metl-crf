function I = RLSA(img, th)
%% Computes RLSA algorithm on an image using a threshold.
% img: Inverted binary image (1->black, 0->white)
% th: RLSA threshold. If none, is computed as Height/2
[H,W] = size(img);
I = zeros(H,W);

% Dynamic 
if nargin == 1
    th = H/2;
end

for y=1:H
    last_black = 0;
    for x=1:W
        I(y,x) = img(y,x);
        if img(y,x) == 1
            if last_black > 0 && img(y, x-1) == 0 && x-last_black <= th
                for j=last_black+1:x
                    I(y,j) = 1;
                end
            end
            last_black = x;
        end
    end
end
end