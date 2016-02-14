function test_laplacian
	[x, y] = meshgrid(-4:4, -3:3);
	U = x .* x + y .* y;
	display('Laplaciano calculado para x² + y²:');
	lap = laplacian(U, 1);
	display(lap);
	display('Soma de erros para a implementação da linguagem (desconsiderando borda):');
	errors = abs(4 * del2(U)(2:end - 1, 2:end - 1) - lap(2:end - 1, 2:end - 1));
	display(sprintf('%.9E', sum(sum(errors))));
end
