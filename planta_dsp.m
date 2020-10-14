% delta1 = 0.144
% delta2 = 0.496
function [controlador,semk,bonito] = planta_dsp()
  clc
  clear
  %%Comandos octave
  pkg load control
  pkg load symbolic
  %%

  Mp = 0.29032 % 0.144/0.496 
  tal = 0.366312831610983
  omega_n = 175.847
  ts5 = 3/(tal*omega_n)
  T = ts5 / 12 
  n = omega_n^2;
  d = [1 2*tal*omega_n omega_n^2];
  
  figure(1)
  Gs = tf(n,d)
  bloco = Gs;
  step(bloco)
  Gz = c2d(Gs,T)
  figure(2)
  step(Gz)
  %% Polo dominante
  Mp_desejado = Mp/2
  ts5_desejado = ts5/2
  tal_desejado = 0.523434491007683 % calculado manualmente
  omega_n_desejado = 246.13 % calculado manualmente
  z = exp(-T*omega_n_desejado*tal_desejado)
  wd = omega_n_desejado*sqrt(1-tal_desejado^2)
  z_ang = T*wd
  cartZ = pol2cart(z,z_ang) % polo dominante
  cartZ = cartZ(1) + cartZ(2)*i

  %condicao angulo 
  polos = pole(Gz)
  zeros = zero(Gz)
  condicao_angulo = @(x) angle(cartZ - x) * 180/pi
  pZ = arrayfun(condicao_angulo,polos)
  oZ = arrayfun(condicao_angulo,zeros) 
  angulo_polo = 180 + sum(oZ) - sum(pZ)

  %novo polo
  y = imag(cartZ)
  x0 = real(cartZ)
  x2 = real(polos(2))

  syms delta
  fi = -angulo_polo * pi/180 %% fi = fi1 + fi2
  fi1 = atan(abs(x2-x0)/y)
  fi2 = @(delta) atan(delta/imag(cartZ))
  novo_delta = solve(fi2(delta)==(fi-fi1),delta)
  x1 = novo_delta - x0

  % Definir controlador

  Beta = eval(x1)
  syms z
  Alpha = z^2 - 1.254*z + 0.6065 % obtido manualmente de Gz
  controlador_semK = (Alpha)/((1*z - 1)*(1*z + Beta))

  Gz = minreal(Gz)
  [Num,Den] = tfdata(Gz,'v')
  Gz_syms=poly2sym(Num,z)/poly2sym(Den,z)
  [num,den] = numden(controlador_semK)
  num = eval(coeffs(num,'all'))
  den = eval(coeffs(den,'all'))
  controlador_semK_tf = tf(num,den,T)

  %%% Controlador + Planta
  FTMA = minreal(controlador_semK_tf * Gz)
  syms z
  [Num,Den] = tfdata(FTMA,'v')
  FTMA_syms=poly2sym(Num,z)/poly2sym(Den,z)

  % condicao modulo
  condicao = double(abs(eval(subs(FTMA_syms,z,cartZ))))
  acharGanho = @(K) K*condicao
  syms x
  K = eval(solve(acharGanho(x)==1,x))
  FTMA = K * FTMA

  % rodar malha fechada

  ftmf2 = minreal(feedback(FTMA,1))
  polos_novos = pole(ftmf2) 
  figure(3)
  
  hold on
  
  step(ftmf2)
  title('Saida controlada')
  figure(5)
  step(controlador_semK_tf)
  title('Saida controlada')
  syms cout
  syms cerr
  [fake1,fake2] = encontrar_recursiva(K*controlador_semK_tf,cout,cerr)
  controlador = K*controlador_semK_tf
  semk=controlador_semK_tf
  bonito = ftmf2
endfunction
