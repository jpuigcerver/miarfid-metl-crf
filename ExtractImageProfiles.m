function [ P, L, U ] = ExtractImageProfiles( I )
%EXTRACTPROFILES Extract image profiles
%   P: Projection Profile. Percentage of black pixels in each column.
%   L: Lower word profile. Normalized distance from the bottom to the last
%   black pixel in each column.
%   U: Upper word profile. Normalized distance from the top to the first
%   black pixel in each column.
[H,W] = size(I);

% Projection profile
P = sum(I, 1)';
P = (P - min(P)) / (max(P) - min(P));
plot(P)

% Lower & Upper word profiles
L = -ones(W+2, 1);
U = -ones(W+2, 1);
L(1) = H/2;
U(1) = H/2;
L(W+2) = H/2;
U(W+2) = H/2;
for x=1:W
    black_pxls = find(I(:,x) ~= 0);
    if size(black_pxls,1) > 0
        U(x+1) = black_pxls(1);
        L(x+1) = black_pxls(end);
    end
end

% In case there are some empty columns, interpolate the Upper and Lower
% profiles for such lines.
x=1;
while x <= W
    if U(x+1) < 0
        j = x + 1;
        while x <= W && U(x+1) < 0; x = x + 1; end
        if x == j
            U(x) = (U(j-1) + U(x+1))/2;
            L(x) = (L(j-1) + L(x+1))/2;
            continue
        end
        u_inc = (U(x+1) - U(j-1))/(x - j);
        l_inc = (L(x+1) - L(j-1))/(x - j);
        if u_inc > 0; U(j:x) = U(j-1):u_inc:U(x+1);
        else U(j:x) = U(j-1); end
        if l_inc > 0; L(j:x) = L(j-1):l_inc:L(x+1);
        else L(j:x) = L(j-1); end
    else
        x = x + 1;
    end
end
L = L(2:end-1);
U = U(2:end-1);
L = (L - min(L))/(max(L) - min(L));
U = (U - min(U))/(max(U) - min(U));
end

