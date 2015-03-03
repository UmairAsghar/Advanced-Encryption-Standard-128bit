function mixCol= mixColumns(A)

B={
    '02' '03' '01' '01';                           
    '01' '02' '03' '01';
    '01' '01' '02' '03';
    '03' '01' '01' '02'
  };
%--------------------------------------------------------------------------
for k=1:4
    for i=1:4
        sum = 0;
        for j=1:4
            if (B{i,j} == '01')
                A_bin=hex2bin(A{j,k},4);
                A_dec = uhex2dec(A_bin(:,:));
                e=A_dec;
            elseif (B{i,j}== '02')
                A_bin = hex2bin(A{j,k},4);
                B_bin = hex2bin(B{k,j},4);
                A_dec = uhex2dec(A_bin(:,:));
                A_sh = bitshift(uint8(A_dec),1);
                if(A_bin(1,1)=='1')
                    e=bitxor(uint8(A_sh),uint8(27));
                else
                    e=A_sh;
                end
            else 
                A_bin = hex2bin(A{j,k},4);
                A_dec = uhex2dec(A_bin(:,:));
                A_sh = bitshift(uint8(A_dec),1);
                if(A_bin(1,1)=='1')
                    ee=bitxor(uint8(A_sh),uint8(27));
                    e=bitxor(ee,A_dec);
                else
                    e=bitxor(A_sh,A_dec); 
                end 
            end
            sum = bitxor(e,sum);
        end
        mixCol{i,k}= dec2hex(sum);
    end
end
end
