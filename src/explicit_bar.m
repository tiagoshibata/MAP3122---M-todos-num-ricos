function Y = explicit_bar(Y, t, w)
%EXPLICIT_BAR Realiza simulação por método explícito para uma barra.
%	Y representa estado atual, t tempo e w perdas/ganhos externos.
	global parameters;

	dl = parameters.length / parameters.subdiv;
	lambda = parameters.alpha * parameters.timestep / (dl ^ 2);

	unit_bar = ones(parameters.subdiv, 1);
	A = build_tridiagonal(lambda * unit_bar, 1 - 2 * lambda * unit_bar, lambda * unit_bar);

	Y = A * Y + (parameters.timestep / parameters.ro / parameters.cp * w) - Y * parameters.timestep * parameters.beta;
end