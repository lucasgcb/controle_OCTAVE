## Comandos Octave
clc
clear
pkg load control

### Planta Simulada
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

### Controlador
num = [1, -1.254, 0.60650]
den = [1, -0.52524, -0.47476]
controlador_semK_tf = tf(num,den,T)
K = 2.3267

### Malha aberta e fechada Simulados
FTMA = minreal(controlador_semK_tf * Gz)
FTMF = minreal(feedback(K*FTMA,1))
figure(3)
step(FTMF)
title('Saida controlada')

### RECURSIVA MALHA FECHADA
T = 0.0038811
tamanho = 64
e = [ones(1,tamanho ) 1.5*ones(1,tamanho ) ones(1,tamanho ) 1.5*ones(1,tamanho )]

K = 2.3267
k = 0:255

%%% COEFICIENTES PLANTA
aC =  -1.25390
bC =  0.60653
aE =  0.19115
bE =  0.16143

%%% COEFICIENTES CONTROLADOR

aU =  -0.52524
bU =  -0.47476
aErr =  -1.254 * K
bErr =  0.6065 * K
cErr = K

C(1) = e(1)
err(1) = e(1) - C(1)
U(1) = cErr*err(1)
C(2) = -aC*C(2-1)  + aE * U(2-1) 
err(2) = e(2) - C(2)
U(2) = -aU*U(1) + aErr * err(1) + cErr*err(2)


for o=3:length(k-1)
    C(o) = -aC*C(o-1) - bC*C(o-2) + aE * U(o-1) + bE * U(o-2) 
    err(o) = e(o) - C(o)
    U(o) = -aU*U(o-1) - bU*U(o-2) + aErr * err(o-1) + bErr * err(o-2)  + cErr*err(o)
end
figure(3)
step(FTMF)
hold on
title('Saida controlada simulada')
plot(k*T,U,'x')
plot(k*T,C,'*')
title('Sistema de controle discretizado')
legend("show");
zoom on
