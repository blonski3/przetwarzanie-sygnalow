function signal = gen_sin(time, fsin, A, fi)
  signal = A * sin(2 * pi * fsin * time + fi);
end
