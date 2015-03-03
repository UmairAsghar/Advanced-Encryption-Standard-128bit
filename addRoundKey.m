function r=addRoundKey(state,roundkey)
   for i=1:4
       for j=1:4
             A = bitxor(hex2dec(state{i,j}),hex2dec(roundkey{i,j}));
             r{i,j}= dec2hex(A);
       end
   end
end