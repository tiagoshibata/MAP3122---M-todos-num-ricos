function Y = explicit_plane(Y, t, w)
%EXPLICIT_PLANE Realiza simulação por método explícito para um plano.
%	Y representa estado atual, t tempo e w perdas/ganhos externos.
	global parameters;

	dl = parameters.length / parameters.subdiv;
	lambda = parameters.alpha * parameters.timestep / (dl ^ 2);

	% n2 guarda subdivisões ao quadrado = dimensão da matriz expandida
	n = length(Y);
	n2 = n ^ 2;
	unit_bar = ones(n2, 1);
	A = build_tridiagonal(lambda * unit_bar, 1 - 4 * lambda * unit_bar, lambda * unit_bar);

	% Condução em Y:
	A = A + lambda * [zeros(n2, n) eye(n2, n2 - n)];
	A = A + lambda * [zeros(n, n2) ; eye(n2 - n, n2)];

	Y = A * Y(:) + (n * w(:)) - Y(:) * parameters.timestep * parameters.beta;
	Y = reshape(Y, n, n);
end