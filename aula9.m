%FILTRO ESTAVEL
%PQ O POLO ESTA NO LADO ESQUERDO DO GRAFICO
b = [1 1];
%SE COLOCAR -1 NO MEIO, O POLO VAI PARA O LADO DIREITO
a = [1 1 5];
[z1,p1,k]=tf2zp(b,a)
z2 = roots(b);
p2 = roots(a);
zplane(b,a);
%%
freqs(b,a);
%%
%NAO ESQUECER QUE ROLA UM GANHO 
%A CONSTANTE QUE MULTIPLICA O K
%RESPOSTA EM FREQUENCIA EM TERMOS ANALITICOS
syms s  w
H(s) = (s+1)/(s^2 + s + 5);
pretty(H(1j*w))
latex(H(1j*w))
ws = logspace(-2, 1, 1000);
h = H(1j*ws);
subplot(211)
semilogx(ws,abs(h)); grid on;
subplot(212)
semilogx(ws,angle(h)/pi*180); grid on;