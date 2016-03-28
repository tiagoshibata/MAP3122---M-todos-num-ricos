function plot_flow(M)
%PLOT_FLOW Mostra graficamente o fluxo (negativo do gradiente) da matriz
% ou vetor M.
	if min(size(M)) == 1
		% É um vetor
		l = length(M);
		M = -partial_deriv(M(:));
		[x, y] = meshgrid(1:20, 1:l);
		image = quiver(x, y, zeros(l, 20), repmat(M, 1, 20));
		% set(image, 'maxheadsize', 0.8);
	else
		% matriz
		[x, y] = meshgrid(size(M) - [1 1]);
		[dM_dx, dM_dy] = -grad(M);
		hold on;
		quiver(dM_dx, dM_dy);
		contour(x, y, M);
		hold off;
	end
	axis ij;	% desenhar com 0 no topo (convenção de enumerar vetor de
				% cima para baixo)
	[m, n] = size(x);
	axis([0 n 0 m]);	% limites
end

% Ver quiver e contour
% http://www.mathworks.com/help/matlab/ref/gradient.html
