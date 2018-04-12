function Gait(Comp)

Rate = 1024/3;

Mask = DispDet(Comp, round(Rate/2),8);
Index = find(Mask);

subplot(1,2,1)
MaxSpect(Comp(Index))

subplot(1,2,2)
DeMod(Comp(Index))

Axis = axis;
Axis(1:2) = [-50 50];
axis(Axis)