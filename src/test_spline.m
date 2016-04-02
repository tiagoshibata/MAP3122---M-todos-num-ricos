function test_spline()
%TEST_SPLINE Testa spline aplicando em um polinômio do terceiro grau
%com condições de contorno (segunda derivada nos extremos) iguais à do
%polinômio
	x = 0:1:10;

	y = [2	x .* x .* x + x .* x + x	62];

	pp = spline(x, y(2:end-1));
	pp.coefs
	x = 0:0.1:10;

	error = ppval(pp, x) - (x .* x .* x + x .* x + x);

	display(mean(error));
end
