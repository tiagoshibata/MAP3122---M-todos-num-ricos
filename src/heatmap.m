function heatmap(u)
%HEATMAP Mostra graficamente a matrix u.
	colormap('hot');	% jet pode ser uma boa opção, testar outros depois
	imagesc(u);
	colorbar;
end
