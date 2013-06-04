function Fd = BinarizeFeatures(F, L)

minD=min(F);
maxD=max(F);
RanD=maxD-minD;
Fd = zeros(size(F));
for i=1:size(F,1)
    for d=1:25
        if RanD(d) ~= 0
            Fd(i,d) = round(((F(i,d) - minD(d)) ./ RanD(d)) * (L - 1));
        end
        nans=isnan(Fd(i,:));
        if sum(nans) ~= 0
            Fd(i,:)
            F(i,:)
        end
    end
end

end
