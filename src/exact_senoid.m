function Y = exact_senoid(Y, t, w)
%EXACT_SENOID Solução exata para estado inicial u(x, 0) = 100 * sin(pi * x) e 
%	alpha = 1.
	global parameters;

	dl = parameters.length / parameters.subdiv;
	
	Y = 0:dl:(parameters.length - dl);
	
	Y = 100 * exp(-pi * pi * t) .* sin(pi .* Y(:));
end