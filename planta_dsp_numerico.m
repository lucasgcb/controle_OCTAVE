## Comandos Octave
clc
clear
zoom on
pkg load control
##


### Planta
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
figure(1)
step(Gz)
title('Planta Discreta')

### Controlador
num = [1, -1.254, 0.60650]
den = [1, -0.52524, -0.47476]
controlador_semK_tf = tf(num,den,T)
K = 2.3267
figure(2)
step(K*controlador_semK_tf,16)
title('Resposta Controlador (com ganho K)')

### Malha aberta e fechada
FTMA = minreal(controlador_semK_tf * Gz)
FTMF = minreal(feedback(K*FTMA,1))
figure(3)
step(FTMF)
title('Saida controlada')

