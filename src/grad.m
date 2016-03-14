function [dM_dx, dM_dy] = grad(M, dl)
%GRAD Calcula gradiente de uma matriz M.
%	Se dl é especificado, ele será usado como valor de espaçamento entre os pontos,
%	senão será assumido 1.
	if nargin < 2
		dl = 1;
	end
	dM_dx = partial_deriv(M, 1, dl);
	dM_dy = partial_deriv(M, 2, dl);
end
