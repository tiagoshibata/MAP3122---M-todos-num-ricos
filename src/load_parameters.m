function load_parameters(print)
%LOAD_PARAMETERS Carrega parâmetros do modelo na variável global parameters.
%	É a única variável global mantida no projeto. Se print é usado como parâmtro,
%	os mostra na tela.
	global parameters;

	if exist('parameters.mat', 'file') == 2
		load('parameters.mat');
	else
		display('Parâmetros não encontrados, usando valores padrões.');
		parameters = struct('k', 1, 'ro', 1, 'cp', 1, 'alpha', [], 'length', 0.01,
			'subdiv', 10, 'timestep', 1e-3);
	end
	parameters.alpha = parameters.k / (parameters.ro * parameters.cp);

	if nargin > 0
		display('Parâmetros atuais:');
		display(sprintf('k (condutividade térmica) = %e [W / (m * K)]', parameters.k));
		display(sprintf('ro = ρ (massa específica) = %e [kg / (m³)]', parameters.ro));
		display(sprintf('cp (calor específico) = %e [J / (kg * K)]', parameters.cp));
		display(sprintf('alpha = α (coeficiente de difusão térmica) = %e [W * m² / J]', parameters.alpha));
		display(sprintf('length = Extensão da barra/placa simulada = %e [m]', parameters.length));
		display(sprintf('subdiv = Subdivisões em uma dimensão = %e', parameters.subdiv));
		display(sprintf('timestep = Passo de tempo = %e', parameters.timestep));
	end
end
