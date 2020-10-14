clear 
clc
T = 0.0038811
tamanho = 64
e = repelem(-2.29,64)
k = 0:32

[controlador,semk] = planta_dsp()
close all
step(controlador,32)
zoom on
hold on
aC =  -0.52524
bC =  -0.47476
K = 2.3267
aE =  -1.254 * K
bE =  0.6065 * K

C(1) = K*e(1)
C(2) = -aC*C(2-1)  + aE * e(2-1) + K*e(1)

for o=3:length(k-1)
     C(o) = -aC*C(o-1) - bC*C(o-2) + aE * e(o-1) + bE * e(o-2)  + K*e(o)
end
plot(k*T,C,'*')