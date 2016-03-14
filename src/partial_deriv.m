function d = partial_deriv(A, dim, dl)
%PARTIAL_DERIV Aproxima a derivada parcial numérica entre pontos da matrix A em dimensão especificada.
%	Retorna uma matrix de dimensões iguais a dada, menos uma dimensão em dim.
%	Se dimensão não é especificada, calcula em y (entre linhas).
%	Se dl é especificado, ele será usado como valor de espaçamento entre os pontos,
%	senão será assumido 1.
	if (nargin > 1) && (dim == 1)
		% Usar transposta para calcular entre colunas
		A = A';
	end

	if nargin < 3
		dl = 1;
	end

	d = zeros(size(A));

	% Derivada parcial entre as linhas nos pontos intermediários
	intermediate_d = (A(2:end, :) - A(1:end - 1, :)) / dl;
	d(1, :) = intermediate_d(1, :);
	d(end, :) = intermediate_d(end, :);
	d(2:end - 1, :) = (intermediate_d(1:end - 1, :) + intermediate_d(2:end, :)) / 2;

	if (nargin > 1) && (dim == 1)
		d = d';
	end
end
