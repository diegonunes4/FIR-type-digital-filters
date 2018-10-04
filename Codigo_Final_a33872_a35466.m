clear all;
close all;

%Fun��o audioread
[sinal_inicial, Fs]=audioread('MP_12.wav');

%Sinal original (com ru�do) 
figure(1);
spectrogram(sinal_inicial, 1024, 960, 1024, Fs, 'yaxis');
title('Espectrograma do sinal original');

%Primeira frequ�ncia
A=1;
%ordem do filtro
N=600;
%intervalo das frequ�ncias
Wn=[0.084 0.1];
B=fir1(N, Wn, 'stop');
sinal=filter(B, A, sinal_inicial);


%Sinal filtrado
figure(2);
spectrogram(sinal, 1024, 960, 1024, Fs, 'yaxis');
title('Espectrograma do sinal filtrado (sem ru�do)');

figure(3);
subplot(2,1,1);plot((1:length(sinal_inicial))/Fs, sinal_inicial);
grid;
title('Onda do Sinal Original');

%figure(4);
subplot(2,1,2);plot((1:length(sinal))/Fs, sinal);
grid;
title('Onda do Sinal Filtrado');

%Reprodu��o a�dio do sinal filtrado
sound(sinal, Fs);
%sound(sinal_inicial, Fs);

%Fase e M�dulo do sinal
figure(4);
freqz(B,A, 256, Fs);

