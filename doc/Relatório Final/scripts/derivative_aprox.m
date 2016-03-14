function derivative_aprox
%DERIVATIVE_APROX Mostra gráfico com cálculo numérico da derivada.
	x = (-2:2)';
	A = x .* x + 1.4;
	intermediate_d = (A(2:end, :) - A(1:end - 1, :));
	d = partial_deriv(A);

	clf;
	hold on;
	grid on;

	plot(x, A, 'k.', 'DisplayName', ['Função analisada']);
	plot(-1.5:1.5, intermediate_d, 'kx', 'DisplayName', ['Derivada nos pontos intermediários']);
	plot(x, d, 'k+', 'DisplayName', ['Derivada nos pontos analisados']);
	legend(gca, 'show');
	title('Aproximação numérica da derivada');
	print('derivative_aprox.eps', '-deps');

	hold off;
end
