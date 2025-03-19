 function signal=gen_gauss(time, u, s)
	 N = length(time);
	 signal = zeros(1,N);
	 for n = 1:N
		 signal(n) = exp(-(time(n)-u)^2/(2*s^2));
	 endfor
 endfunction
