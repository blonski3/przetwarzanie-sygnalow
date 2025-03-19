function y = sig_delay_N(x, Nd)
	 N = length(x);
	 y = zeros(1, N);
	 for i = Nd+1:N
		 y(i) = x(i - Nd);
	 endfor
 endfunction
