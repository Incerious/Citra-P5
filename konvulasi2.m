function [G] = konvulasi2(F, H)
  [t_f, l_f] = size(F);
  [t_h, l_h] = size(H);
  
  m2 = floor(t_h /2);
  n2 = floor(l_h /2);
  F2 = double(F);
  
  for y=1 : t_f
    for x=1 : l_f
      
      jum = 0;
      
      for p=-m2 : m2
        for q=-n2 : n2
          x2 = x-q;
          if x2 < 1
            x2 = -x2 + 1;
            else
           if x2 > l_f
             x2 = 2 * l_f - x2 + 1;
           endif
          endif
          y2 = y-p;
          if y2 < 1
            y2 = -y2 + 1;
            else
            if y2 > t_f
              y2 = 2 * t_f - y2 + 1;
            endif
          endif
          jum = jum + H(p+m2+1, q+m2+1) * F2(y2, x2);
        endfor
      endfor
      G(y,x) = jum;
    endfor
  endfor
  imshow(G);
endfunction
