function calc_DEP(x, fs, norm_freq)
% Aproxima la densidad espectral de potencia de la señal x

% INPUTS:
% x = señal de entrada
% fs = frecuencia de muestreo de x
% norm_freq (opcional) = especifica para mostrar la DEP con frecuencia 
%                        normalizada.norm_freq='fn'.


if nargin <= 2
  norm_freq = 0;
end
% Se aproxima la densidad espectral de potencia con pwelch
[pxx,f] = pwelch(x,ones(1,1e3),0,1e3,fs,'onesided');

% Se define en que formato se va mostrar la frecuencia
freq = f/1000;
freq_label = 'Frecuencia (kHz)';
if norm_freq == 'fn'
  freq = f/(fs/2);
  freq_label = 'Frecuencia Normalizada';  
end

% Se imprime el grafico de DEP
figure
plot(freq, pxx)
xlabel(freq_label)
ylabel('PSD (power spectral density)')
end