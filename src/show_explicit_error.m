function show_explicit_error(method)
%SHOW_EXPLICIT_ERROR Calcula erro do método recebido como argumento
%comparando com exact_senoid.m.
	global parameters;
	
	load_parameters('parameters_exact_senoid', 1);
	display('Formato: timestep erro_médio');

	dl = parameters.length / parameters.subdiv;
	exact = exact_senoid(0, parameters.end_time, 0);
	for i = 1:1
		Y = 0:dl:(parameters.length - dl);
		Y = 100 * sin(pi * Y(:));
		for t = 0:parameters.timestep:parameters.end_time
			Y = feval(method, Y, t, zero_bar());
		end
		display(sprintf('%d %d\n', parameters.timestep, mean(abs(exact - Y))));
		parameters.timestep = parameters.timestep / 2;
	end
	
	load_parameters('parameters_exact_senoid', 1);
	display('Formato: timestep t erro');
	parameters.timestep	= 6.250000e-05;
	parameters.end_time	= 1.250000e-04;
	for i = 1:12
		Y = 0:dl:(parameters.length - dl);
		Y = 100 * sin(pi * Y(:));
		%for t = 0:parameters.timestep:parameters.end_time
			t = parameters.timestep;
			Y = feval(method, Y, t, zero_bar());
		%end
		exact = exact_senoid(0, t, 0);
		display(sprintf('%d %.9e %d\n', parameters.timestep, t, mean(abs(exact - Y))));
		parameters.timestep	= parameters.timestep / 2;
	end
	
	load_parameters('parameters_exact_senoid', 1);
	display('Formato: divisões erro_médio');
	parameters.subdiv = 2;
	parameters.timestep = 1e-4;
	parameters.end_time = 1;
	
	for i = 1:12
		dl = parameters.length / parameters.subdiv;
		Y = 0:dl:(parameters.length - dl);
		Y = 100 * sin(pi * Y(:));
		%for t = 0:parameters.timestep:parameters.end_time
			Y = feval(method, Y, t, zero_bar());
			%if max(Y) - min(Y) > 1e5
			%	display('Divergindo');
			%	continue
			%end
		%end
		exact = exact_senoid(0, parameters.timestep, 0);
		display(sprintf('%d %d\n', parameters.subdiv, mean(abs(exact - Y))));
		parameters.subdiv = parameters.subdiv * 2;
	end
end