function x = thomas_algorithm(M, d)
%THOMAS_ALGORITHM Realiza o algoritmo de Thomas para resolver matrix tridiagonal.
%	Na chamada, use apenas M quadrada e tridiagonal, ou uma matrix n x 3, onde
%	cada linha possui os 3 termos não nulos da linha da matrix. Resolve M * x = d.

	% Pré-processamento
	n = length(M);
	if size(M, 3) == 3
		a = M(:, 1);
		b = M(:, 2);
		c = M(:, 3);
	else
		% vetor coluna com elementos da diagonal abaixo da principal
		a = sum([zeros(1, n) ; eye(n - 1, n)] .* M, 2);
		% vetor coluna com elementos da diagonal principal
		b = sum(eye(n) .* M, 2);
		% vetor coluna com elementos da diagonal acima da principal
		c = sum([zeros(n, 1) eye(n, n - 1)] .* M, 2);
	end

	% Primeira passagem atualizando c:
	c(1) = c(1) / b(1);
	for i = 2:n - 1
		c(i) = c(i) / (b(i) - a(i) * c(i - 1));
	end

	% Primeira passagem atualizando d:
	d(1) = d(1) / b(1);
	for i = 2:n
		d(i) = (d(i) - a(i) * d(i - 1)) / (b(i) - a(i) * c(i - 1));
	end

	% Solução
	x = zeros(n, 1);
	x(n) = d(n);
	for i = n - 1:-1:1
		x(i) = d(i) - c(i) * x(i + 1);
	end
end
