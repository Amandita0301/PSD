%  Exemplos e Experimentos baseados no livro:
% DINIZ, P. S. R., DA SILVA, E. A. B., e LIMA NETTO, S. Processamento Digital de Sinais: Projeto e Análise de Sistemas. 2. ed. Porto Alegre: Bookman, 2014. 976 p. ISBN 978-8582601235.
%% Experimento 2.2
% Resposta em frequencia usando a função freqz
N = 1;
num = [1 0 0 0];
den = poly([0.8 0.2])
%den = [1 0.6 -0.16];
% modo 1
%[H,w]=freqz(num,den,[0:pi/100:N*pi-pi/100]);
%plot(w/pi, abs(H));
% modo 2
%[H,w]=freqz(num,den);
%plot(w/pi, abs(H));
% modo 3
%[H,w]=freqz(num, den, 'whole');
%plot(w/pi, abs(H));
% modo 4
freqz(num, den, 'whole');
figure(2);
zplane(num,den);

%% Resposta em frequencia substituindo z -> e^(jw)
syms z
Hf(z) = symfun(z^2/(z-0.2)/(z+0.8),z);
pretty(Hf)
latex(Hf)
N = 1;
w = [0:pi/100:N*pi-pi/100];
plot(w/pi,abs(Hf(exp(1i*w))))
%title(['$' latex(Hf) '$'],'interpreter','latex')
text(0.2,2,['H(z) = ' '$$' latex(Hf) '$$'],'interpreter','latex')
xlabel(['w/' '$$' '\pi' '$$'],'interpreter','latex')