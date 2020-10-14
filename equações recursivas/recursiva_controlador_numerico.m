## Comandos Octave
clc
clear
pkg load control
##

T = 0.0038811
tamanho = 64
e = ones(1,tamanho )
k = 0:32

### Controlador
num = [1, -1.254, 0.60650]
den = [1, -0.52524, -0.47476]
controlador_semK_tf = tf(num,den,T)
K = 2.3267
figure(2)
controlador = K*controlador_semK_tf
step(controlador,1)
hold on
zoom on
### Plot recursiva

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