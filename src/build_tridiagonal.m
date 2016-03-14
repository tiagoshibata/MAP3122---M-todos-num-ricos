function M = build_tridiagonal(a, b, c)
%BUILD_TRIDIAGONAL Recebe vetores a, b e c e contrói matriz tridiagonal.
%	a é tomado como diagonal inferior, b como principal e c como superior.
	a = a(:);
	b = b(:);
	c = c(:);
	n = length(b);
	M = [zeros(1, n) ; eye(n - 1, n)] .* repmat(a, 1, n) + ...
		eye(n) .* repmat(b, 1, n) + ...
		[zeros(n, 1) eye(n, n - 1)] .* repmat(c, 1, n);
end
