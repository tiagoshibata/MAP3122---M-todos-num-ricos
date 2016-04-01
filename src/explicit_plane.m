function Y = explicit_plane(Y, t, w)
%EXPLICIT_PLANE Realiza simulação por método explícito para um plano.
%	Y representa estado atual, t tempo e w perdas/ganhos externos.
	global parameters;

	dl = parameters.length / parameters.subdiv;
	lambda = parameters.alpha * parameters.timestep / (dl ^ 2);

	unit_bar = ones(parameters.subdiv, 1);
	A = build_tridiagonal(lambda * unit_bar, 1 - 2 * lambda * unit_bar, lambda * unit_bar);
	Y = Y(:);

	Y = A * Y + (parameters.timestep * w) - Y * parameters.timestep * parameters.beta;
end