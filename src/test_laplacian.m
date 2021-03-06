function test_laplacian
%TEST_LAPLACIAN Testa laplacian.m.
%	Testa em matrix com valores de x² + y², comparando com valores calculados
%	por del2().
	[x, y] = meshgrid(-4:4, -3:3);
	U = x .* x + y .* y;
	display('Laplaciano calculado para x² + y²:');
	lap = laplacian(U, 1);
	display(lap);
	errors = abs(4 * del2(U)(2:end - 1, 2:end - 1) - lap(2:end - 1, 2:end - 1));
	display(sprintf('Soma de erros para a implementação da linguagem (desconsiderando borda): %.9E', sum(sum(errors))));
end
