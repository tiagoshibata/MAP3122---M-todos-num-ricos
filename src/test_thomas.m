function test_thomas
%TEST_thomas Testa thomas_algorithm.m.
%	Compara com saídas do resolvedor de sistemas lineares do ambiente.
	n = 5;	% dimensão da matriz para teste
	a = [0 ; rand(n - 1, 1)];
	b = rand(n, 1);
	c = [rand(n - 1, 1) ; 0];
	d = rand(n, 1);

	M = build_tridiagonal(a, b, c);
	display('Sistema a ser testado:');
	display('M * x = d');
	display('M =');
	display(M);
	display('d =');
	display(d);

	system_sol = M \ d;
	display('Solução do sistema:');
	display(system_sol);

	our_sol = thomas_algorithm(M, d);
	display('Solução da implementação do trabalho:');
	display(our_sol);

	display('Soma dos erros absolutos:');
	display(sum(sum(abs(our_sol - system_sol))));

	our_sol = thomas_algorithm([a b c], d);
	display('Solução da implementação do trabalho em formato de 3 colunas:');
	display(our_sol);

	display('Soma dos erros absolutos:');
	display(sum(sum(abs(our_sol - system_sol))));
end
