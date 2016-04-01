function simulate_bar(simulation_function, Y, w)
%SIMULATE_BAR Programa principal que realiza a simulação de uma barra.
%	Recebe como parâmetro uma referência a função do tipo f(Y, t, w),
%	Y inicial e w.

	global parameters;

	for t = 0:parameters.timestep:parameters.end_time
		display(sprintf('t = %d\n', t));

		Y = feval(simulation_function, Y, t, w);

		figure(1);
		plot_heatmap(Y);
		figure(2);
		plot_flow(Y);
	end
end
