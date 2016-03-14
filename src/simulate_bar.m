function simulate_bar
%SIMULATE_BAR Programa principal que realiza a simulação de uma barra.
	global parameters;

	dl = parameters.length / parameters.subdiv;
	lambda = parameters.alpha ^ 2 * parameters.timestep / (dl ^ 2);

	bar = zeros(parameters.subdiv, 1);
	bar(1:5) = 1;

	unit_bar = ones(parameters.subdiv, 1);
	A = build_tridiagonal(lambda * unit_bar, 1 - 2 * unit_bar, lambda * unit_bar);

	for t = 0:parameters.timestep:(parameters.end_time + parameters.timestep)
		display(sprintf('t = %d\n', t));

		bar = A * bar;

		plot_heatmap(bar);
		pause;
	end
end
