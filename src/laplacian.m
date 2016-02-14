function nabla = laplacian(A, dx)
%LAPLACIAN Computa nabla = del2(A).
%	Usado para aproximar numericamente o laplaciano de uma matriz ou vetor.
%	Baseado em:
%	https://www.informatik.hu-berlin.de/de/forschung/gebiete/viscom/thesis/final/Diplomarbeit_Herholz_201301.pdf
	nabla = -4 * A;
	[n, m] = size(A);

	if n > 1
		% Mais que uma linha
		nabla(2:end - 1, 2:end - 1) += A(1:end - 2, 2:end - 1);
		nabla(2:end - 1, 2:end - 1) += A(3:end, 2:end - 1);
		% Condições na borda (temperatura constante)
		nabla(1, :) = 0;
		nabla(end, :) = 0;
	end

	if m > 1
		% Mais que uma coluna
		nabla(2:end - 1, 2:end - 1) += A(2:end - 1, 1:end - 2);
		nabla(2:end - 1, 2:end - 1) += A(2:end - 1, 3:end);
		% Condições na borda (temperatura constante)
		nabla(:, 1) = 0;
		nabla(:, end) = 0;
	end

	nabla(2:end-1, 2:end-1) /= dx * dx;
end
