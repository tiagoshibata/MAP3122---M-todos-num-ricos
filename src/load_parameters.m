function load_parameters(file, print)
%LOAD_PARAMETERS Carrega parâmetros do modelo na variável global parameters.
%	É a única variável global mantida no projeto.
%	Se parâmetro file não for passado, carrega de arquivo padrão
%	(parameters.mat).
%	Se print é usado como parâmtro,	mostra parâmetros na tela.
	global parameters;

	if nargin == 0 || length(file) == 0
		file = 'parameters.mat';
	end

	if exist(file, 'file') == 2 || exist(sprintf('%s.mat', file), 'file') == 2
		load(file);
	else
		% Usar alguns valores padrões
		parameters = struct('k', 1, 'ro', 1, 'cp', 1, 'alpha', [], 'beta', 1, ...
			'length', 0.01, 'subdiv', 10, 'timestep', 1e-4, 'end_time', 5);
	end
	parameters.alpha = parameters.k / (parameters.ro * parameters.cp);

	if nargin > 1
		display('Parâmetros atuais:');
		display(sprintf('k (condutividade térmica) = %e [W / (m * K)]', parameters.k));
		display(sprintf('ro = ρ (massa específica) = %e [kg / (m³)]', parameters.ro));
		display(sprintf('cp (calor específico) = %e [J / (kg * K)]', parameters.cp));
		display(sprintf('alpha = α (coeficiente de difusão térmica) = %e [W * m² / J]', parameters.alpha));
		display(sprintf('beta = (coeficiente de difusão térmica com o ambiente) = %e [W * m² / J]', parameters.beta));
		display(sprintf('length = Extensão da barra/placa simulada = %e [m]', parameters.length));
		display(sprintf('subdiv = Subdivisões em uma dimensão = %e', parameters.subdiv));
		display(sprintf('timestep = Passo de tempo = %e', parameters.timestep));
		display(sprintf('end_time = Tempo total de simulação = %e', parameters.end_time));
	end
end
