function Y = newton(Y, g, dg_dy)
%NEWTON Executa o método de Newton para dada g(y) e g'(y), buscando raíz de g(y).
%	O número de iterações é usado como critério de parada (20 iterações).
	for i = 1:20
		Y = Y - feval(g, Y) / feval(dg_dy, Y);
	end
end
