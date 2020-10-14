
clear
clc
[blah,bleh,bonito] = planta_dsp()
close all
figure(9)
T = 0.0038811
title('resposta ao degrau controlador')
tamanho = 64
e = ones(1,tamanho )
K = 2.3267
k = 0:32 

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

C(1) = 0
err(1) = e(1) - C(1)
U(1) = cErr*err(1)
C(2) = -aC*C(2-1)  + aE * U(2-1) 
err(2) = e(1) - C(2)
U(2) = -aU*U(2-1)  + aErr * err(2-1)  + K*err(2)

for o=3:length(k-1)
    C(o) = -aC*C(o-1) - bC*C(o-2) + aE * U(o-1) + bE * U(o-2) 
    err(o) = e(o) - C(o)
    U(o) = -aU*U(o-1) - bU*U(o-2) + aErr * err(o-1) + bErr * err(o-2)  + cErr*err(o)
end

plot(k*T,U,'x')
hold on
zoom on

plot(k*T,C,'*')
step(bonito,32)
title('Sistema de controle discretizado')
