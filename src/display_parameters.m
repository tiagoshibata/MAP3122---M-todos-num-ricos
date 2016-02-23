function display_parameters
%DISPLAY_PARAMETERS Função que mostra na tela parâmetros atuais do modelo.
	if exist('parameters.mat', 'file') ~= 2
		display('Falha ao carregar arquivo de parâmetros');
	else
		load('parameters.mat');
		display('Parâmetros atuais:');
		display(sprintf('k (condutividade térmica) = %e [W / (m * K)]', parameters.k));
		display(sprintf('ro = ρ (massa específica) = %e [kg / (m³)]', parameters.ro));
		display(sprintf('cp (calor específico) = %e [J / (kg * K)]', parameters.cp));
		display(sprintf('alpha = α (coeficiente de difusão térmica) = %e [W * m² / J]', parameters.alpha));
		display(sprintf('length = Extensão da barra/placa simulada = %e [m]', parameters.length));
		display(sprintf('subdiv = Subdivisões em uma dimensão = %e', parameters.subdiv));
	end
end
