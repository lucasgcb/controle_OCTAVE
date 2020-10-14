clear 
clc
T = 0.0038811
tamanho = 64
e = ones(1,tamanho )
k = 0:32

aC =  -1.254
bC =  0.6065

aE =  0.1912
bE =  0.1614

C(1) = 0
C(2) = -aC*C(2-1)  + aE * e(2-1) 

for o=3:length(k-1)
     C(o) = -aC*C(o-1) - bC*C(o-2) + aE * e(o-1) + bE * e(o-2) 
end
figure(4)
Mp = 0.29032 % 0.144/0.496 
tal = 0.366312831610983
omega_n = 175.847
ts5 = 3/(tal*omega_n)
T = ts5 / 12 
n = omega_n^2;
d = [1 2*tal*omega_n omega_n^2];

Gs = tf(n,d);
bloco = Gs;
Gz = c2d(Gs,T)
syms cout cerr
[fake1,fake2] = encontrar_recursiva(Gz,cout,cerr)
plot(k*T,C,'*')
zoom on
hold on
step(Gz,16)