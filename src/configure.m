function configure
%CONFIGURE Lê configurações e muda parâmetros do modelo.
	global parameters;

	load_parameters(1);

	display('Todos os parâmetros podem ser alterados, menos α (coeficiente de');
	display('difusão térmica), que será calculado em função de k, ρ e cp.');

	while ~strcmp(key = input('Digite um parâmetro para modificar (ou Enter para sair): ', 's'), '')
		value = input(sprintf('Novo valor de %s: ', key));
		parameters.(key) = value;
	end

	display(sprintf('Desses parâmetros, calcula-se alpha = %e [W * m² / J]',
		parameters.k / (parameters.ro * parameters.cp)));

	save('parameters.mat', 'parameters');
	display('Configuração escolhida:');
	load_parameters(1);
end
