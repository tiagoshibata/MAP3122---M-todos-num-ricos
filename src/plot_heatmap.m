function plot_heatmap(u)
%PLOT_HEATMAP Mostra graficamente a matrix u.
	clf
	colormap('hot');	% jet pode ser uma boa opção, testar outros depois
	imagesc(u);
	colorbar;
	drawnow limitrate;
end
