function relative_var = max_relative_variation(A, B)
%RELATIVE_VARIATION Calcula a variação relativa em módulo máxima entre A e B.
%	A matriz A representa estado antigo e a matriz B estado novo.
%	Termos nulos em A e B possuem variação relativa 0. Termos nulos em um
%	e não nulos em outro possuem variação relativa +/- 1.
	A_zeros = (A == 0);
	B_zeros = (B == 0);
	% Em entradas com 0 antes e depois da iteração, devemos considerar
	% variação relativa nula. Esse caso merece tratamento especial, já
	% que realizar (0 - 0) / 0 resultaria em NaN.
	% Se ambos nulos, somar um no denominador para evitar divisão
	% por 0.
	relative_var = max(abs((B - A) ./ (B + (A_zeros & B_zeros))));
end