function plot_heatmap(u, lims)
%PLOT_HEATMAP Mostra graficamente a matrix u.
%	O parâmetro opcional lims indica limites da escala (0 a 100 se não definido).
	clf
	colormap('hot');	% jet pode ser uma boa opção, testar outros depois
	if nargin < 2
		lims = [0 100];
	end
	imagesc(u, lims);
	colorbar;
	drawnow limitrate;
end
