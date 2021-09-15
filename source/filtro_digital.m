function [y]= filtro_digital(x, ord_filtro, wn)
% Se aplica un filtro digital a la se�al x

% INPUTS:
% x = se�al de entrada
% ord_filtro = orden del filtro a construir
% wn = frecuencia de corte normalizada . Donde wn=B/(fs/2) siendo 
%      B es el ancho de banda en hz.
% OUTPUTS:
% y = se�al filtrada

% dise�a filtro butterworth
[num, dem] = butter(ord_filtro, wn);
% Graficamos el filtro contruido
figure
freqz(num, dem);
% Se aplica el filtro
y = filter(num, dem, x);
end