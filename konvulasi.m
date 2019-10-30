function [G] = konvulasi(F, H)
  [t_f, l_f] = size(F);
  [t_h, l_h] = size(H);
  
  m2 = floor(t_h /2);
  n2 = floor(l_h /2);
  
  F2 = double(F);
  for y=m2+1 : t_f-m2
    for x=n2+1 : l_f-n2
      jum = 0;
      for p=-m2 : m2
        for q=-n2 : n2
          jum = jum + H(p+m2+1, q+n2+1) * ...
          F2(y-p, x-q);
        endfor
      endfor
      G(y-m2, x-n2) = jum;
    endfor
  endfor
  imshow(G);
endfunction
