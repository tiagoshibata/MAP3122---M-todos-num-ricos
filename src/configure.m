function configure
%CONFIGURE Lê configurações e muda parâmetros do modelo.

	if exist('parameters.mat', 'file') == 2
		load('parameters.mat');
	else
		parameters = struct('k', 1, 'ro', 1, 'cp', 1, 'alpha', [], 'length', 0.01, 'subdiv', 10);
	end

	display_parameters();
	display('Todos os parâmetros podem ser alterados, menos α (coeficiente de');
	display('difusão térmica), que será calculado em função de k, ρ e cp');


	while ~strcmp(key = input('Digite um parâmetro para modificar (ou Enter para sair): ', 's'), '')
		value = input(sprintf('Novo valor de %s: ', key));
		parameters.(key) = value;
	end

	parameters.alpha = parameters.k / (parameters.ro * parameters.cp);
	display(sprintf('Desses parâmetros, calcula-se alpha = %e [W * m² / J]', parameters.alpha));

	save('parameters.mat', 'parameters');
	display('Configuração escolhida:');
	display_parameters();

end
