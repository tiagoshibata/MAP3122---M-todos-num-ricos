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
	if min(size(u)) ~= 1
		ylabel('Y (m)');
		xlabel('X (m)');
	else
		ylabel('Posição (m)');
	end
	title('Escala de temperatura');
	drawnow limitrate;
end
