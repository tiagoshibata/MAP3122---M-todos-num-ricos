function plot_splines(Y)
%PLOT_SPLINES Desenha Y e splines de Y.
	clf;
	hold on;
	ylabel('Temperatura (°C)');
	xlabel('Posição (m)');
	title('Resultado da simulação com método implícito');
	n = length(Y);
	plot(1:1:n, Y, '.', 'DisplayName', 'Pontos calculados');
	pp = spline(1:1:n, Y);
	pol = ppval(pp, 1:0.01:n);
	plot(1:0.01:n, pol, 'DisplayName', 'Splines');
	legend(gca, 'show');
	hold off;
end