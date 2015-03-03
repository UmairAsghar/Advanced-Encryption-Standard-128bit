function r=addRoundKey1(state,roundkey)
   for i=1:4
       for j=1:4
             A = bitxor(state(i,j),hex2dec(roundkey{i,j}));
             r{i,j}= dec2hex(A);
       end
   end
end