%% Variação do Experimento 3.1 do livro:
% DINIZ, P. S. R., DA SILVA, E. A. B., e LIMA NETTO, S. Processamento Digital de Sinais: Projeto e Análise de Sistemas. 2. ed. Porto Alegre: Bookman, 2014. 976 p. ISBN 978-8582601235.
% FILE: Ex3_1.m
% Exemplificando as possiveis formas de realizar a filtragem de um sinal x(n)

%clc; clear all; close all;
%% Definindo valores iniciais
Nh = 100; Nx = 20000; 
%Nh = 400; Nx = 10000;

%-----------------------------------------
%VARIOS UNS
x = ones(1,Nx);

% A resposta ao impulso de um sistema h(n) 
% no filtro FIR aos coeficientes b(n) = h(n) 
h = [1:Nh]; b = h;
%% Filtrando o sinal e medindo tempos

% OPÇÃO 1 - Filtragem utilizando a convolução
% NOTE: length(y) = length(x) + length(h) -1

tic;  % iniciar a contagem do tempo
y1 = conv(x,h); 
t(1) = toc; % terminar a contagem e mostrar tempo no console

% OPÇÃO 2 - filtragem utilizando a equação recursiva
% NOTE: length(y) = length(x)

tic;
y2 = filter(b,1,x);
t(2) = toc;

% OPÇÃO 3 - filtragem utilizando a equação recursiva 
% aumentando o tamanho de x para que length(y3) = length(y1)
x3 = [x zeros(1,length(h)-1)];

tic;
y3 = filter(h,1,x3); 
t(3) = toc;

length_y = length(x) + length(h) - 1;

% OPÇÃO 4 - filtragem utilizando a FFT 
% a y = IFFT(FFT(x)*FFT(h))

tic;
X = fft(x,length_y);
H = fft(h,length_y);

%------------------------------
%.*MULTIPLICAÇÃO PONTO A PONTO
Y4 = X.*H;
y4 = ifft(Y4);
t(4) = toc;

% OPÇÃO 5 - filtragem utilizando a função fftfilt
% a y = IFFT(FFT(x)*FFT(h))

tic
y5 = fftfilt(h,x3);
t(5) = toc;

disp('Comprimento do vetor de saída length(y)')
disp(['    ' num2str([length(y1) length(y2) length(y3) length(y4) length(y5)])])
disp('Tempo usado na filtragem em micro segundos')
disp(['    ' num2str(t*1e6) ' us'])

%%  Plotando o gráfico
subplot(611);stem(y1);
hold on;
stem(y2,'xr');
stem(y3,'+m');
legend('y1', 'y2', 'y3')
hold off
subplot(612);stem(y1, 'ob');legend('y1')
subplot(613);stem(y2, 'xr'); hold on; stem(zeros(size(y1)),'.w');hold off; legend('y2')
subplot(614);stem(y3, '+m');legend('y3')
subplot(615);stem(y4, '+k');legend('y4')
subplot(616);stem(y5, 'ob');legend('y5')
