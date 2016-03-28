function Y = newton(Y, g, dg_dy)
%NEWTON Executa o método de Newton para dada g(y) e g'(y), buscando raíz de g(y).
%	A variação relativa é usada como critério de parada, além do número de
%	iterações (100 iterações).
	for i = 1:100
		Y_prev = Y;
		Y = Y - feval(g, Y) / feval(dg_dy, Y);
		if max_relative_variation(Y_prev, Y) < 1e-4
			return;
		end
	end
end
