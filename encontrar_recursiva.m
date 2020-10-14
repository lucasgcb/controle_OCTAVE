function [func_erro,func_saida] = encontrar_recursiva(tf,cout,err)
    %%% Encontre as equações de erro e saída.
    %%% Iguale para encontrar a equação recursiva
    syms Cz
    syms Ez
    syms z
    syms k
    % Achar coeficientes
    [n,d] = tfdata(tf)
    % Formatar
    n = cell2mat(n)
    d = cell2mat(d)
    % Retirar Zeros
    % n(n==0)=[]
    d(d==0)=[]
    % Visualizar equação direita e esquerda em Z
    fake_left = expand(vpa(poly2sym(n,z),5) * Ez)
    fake_right = expand(vpa(poly2sym(d,z),5) * Cz)
    % Observar numero de deslocamentos
    deslocamentos_left = length(n)
    deslocamentos_right = length(d)
    % Registrar coeficientes com deslocamentos em tempo discreto
    % vpa -> 5 casas de precisão
    a = [vpa(n(1),5) err + (deslocamentos_left - 1)]
    for o = 2:deslocamentos_left
        a(o,:) = [vpa(n(o),5) err + (deslocamentos_left - o)];
        o
        a
    end
    
    b = [vpa(d(1),5) cout + (deslocamentos_right - 1)];
    for o = 2:deslocamentos_right
        b(o,:) = [vpa(d(o),5) cout + (deslocamentos_right - o)];
    end
    
    fake_err = a;
    fake_cout = b;
    
    % Achar maior deslocamento para C(k)
    for o = 1:length(fake_cout)
        des(o) = subs(fake_cout(o,2), cout, 0);
    end
    deslocar = max(des)
    % Cada termo vai estar em uma linha da matriz, coluna 2 terá o simbolo
    % Deslocar ambos os lados baseado no indice da coluna 2
    size_fake_err = size(fake_err)
    for o = 1:size_fake_err(1)
        fake_err(o,2) = fake_err(o,2) - deslocar;
    end
    size_fake_cout = size(fake_cout)
    for o = 1:size_fake_cout(1)
        fake_cout(o,2) = fake_cout(o,2) - deslocar;
    end
    
    func_erro = fake_err
    func_saida = fake_cout
    
    %%% Iguale matematicamente: func_saida = func_erro
    %%% Nota: Isso ainda é manual.
    %%% Isole o termo inicial em func_saida na equação
    %%% para encontrar a equação recursiva.
    %%% Encontre os valores iniciais para valores =< 0.
    
    % Achar valores iniciais em indices negativos
%     for o = 1:length(fake2) 
%         index = subs(fake_cout(o,2), cout, 0) + 1
%         if index < 0
%             y(1 - index) = 0
%         end
%         if index == 0
%             y(1) = 0
%         end
%     end
    
    %% Continuar
    
end
