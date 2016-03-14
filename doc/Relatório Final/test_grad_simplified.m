function test_grad
%TEST_GRAD Testa grad.m.
%	Testa em matrix com valores aleatórios.
	M = rand(8);
	[our_dM_dx, our_dM_dy] = grad(M);
	[system_dM_dx, system_dM_dy] = gradient(M);

	errors = sum(sum(abs(our_dM_dx - system_dM_dx))) + sum(sum(abs(our_dM_dy - system_dM_dy)));
	display(sprintf('Soma dos erros para solução esperada: %.9E', errors));
end
