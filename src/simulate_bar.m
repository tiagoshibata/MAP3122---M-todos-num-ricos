function simulate_bar
%SIMULATE_BAR Programa principal que realiza a simulação de uma barra.
	global parameters;

	h = parameters.length / parameters.subdiv;
	lambda = parameters.alpha ^ 2 * parameters.timestep / (h ^ 2);
	bar = zeros(parameters.subdiv, 1);
end
