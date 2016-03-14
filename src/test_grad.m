function test_grad
%TEST_GRAD Testa grad.m.
%	Testa em matriz com valores aleatórios.
	M = rand(8);

	[our_dM_dx, our_dM_dy] = grad(M);
	display('Gradiente calculado:');
	display(our_dM_dx);
	display(our_dM_dy);

	[system_dM_dx, system_dM_dy] = gradient(M);
	display('Gradiente calculado pela implementação do sistema:');
	display(system_dM_dx);
	display(system_dM_dy);

	errors = sum(sum(abs(our_dM_dx - system_dM_dx))) + sum(sum(abs(our_dM_dy - system_dM_dy)));
	display(sprintf('Soma dos erros para solução esperada: %.9E', errors));
end
