function plot_flow(M)
%PLOT_FLOW Mostra graficamente o gradiente da matriz ou vetor M.
	if min(size(M)) == 1
		% É um vetor
		M = partial_deriv(M(:));
		[x, y] = meshgrid(1:length(M), 1);
		image = quiver(x, y, M', zeros(1, length(M)), .8);
		set(image, 'maxheadsize', 0.8);
	else
		[x, y] = meshgrid(size(M) - [1 1]);
		display(x);
		display(y);
		display(size(M));
		[dM_dx, dM_dy] = grad(M);
		hold on;
		quiver(dM_dx, dM_dy);
		contour(x, y, M);
		hold off;
	end
end

% Ver quiver e contour
% http://www.mathworks.com/help/matlab/ref/gradient.html
