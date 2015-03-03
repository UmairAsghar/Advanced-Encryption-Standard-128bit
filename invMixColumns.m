function inv_mc=invMixColumns(A)
B={
    '0E' '0B' '0D' '09';                           
    '09' '0E' '0B' '0D';
    '0D' '09' '0E' '0B';
    '0B' '0D' '09' '0E'
  };
%--------------------------------------------------------------------------
for k=1:4
    for i=1:4
        sum = 0;
        for j=1:4
            if (B{i,j} == '09')
                A_bin = hex2bin(A{j,k},4);
                n=length(A{j,k});
                if(n==1)
                    A_dec=bin2dec(A_bin(1,:));
                else
                    A_dec = uhex2dec(A_bin(:,:));
                end
                ee=hex2dec(A{j,k});
                    for inner = 1:3
                        if (inner == 1)
                            eee=A_dec;
                            A_b=A_bin;
                            A_sh = bitshift(uint8(A_dec),1);
                        else
                            Adh=dec2hex(eee);
                            A_b=hex2bin(Adh,4);
                            A_sh = bitshift(uint8(eee),1);
                        end
                        if(A_b(1,1)=='1' && eee>15)
                            eee=bitxor(uint8(A_sh),uint8(27));
                        else
                            eee=A_sh;
                        end
                    end
                e=bitxor(ee,eee);
            elseif (B{i,j}== '0B')
                A_bin = hex2bin(A{j,k},4);
                n=length(A{j,k});
                if(n==1)
                    A_dec=bin2dec(A_bin(1,:));
                else
                    A_dec = uhex2dec(A_bin(:,:));
                end
                ee=hex2dec(A{j,k});
                for shft = 2:3
                    if(shft == 2)inner =2; else inner=1;end
                    while (inner <= shft)
                        if (inner == 1 || shft ==2)
                            eee=A_dec;
                            A_b=A_bin;
                            A_sh = bitshift(uint8(A_dec),1);
                        else 
                            Adh=dec2hex(eee);
                            A_b=hex2bin(Adh,4);
                            A_sh = bitshift(uint8(eee),1);
                        end
                        if(A_b(1,1)=='1' && eee>15)
                            eee=bitxor(uint8(A_sh),uint8(27));
                        else
                            eee=A_sh;
                        end
                      inner =inner + 1;
                    end
                  ee= bitxor(ee,eee);
                end
                e=ee;
            elseif (B{i,j}== '0D') 
                A_bin = hex2bin(A{j,k},4);
                n=length(A{j,k});
                if(n==1)
                    A_dec=bin2dec(A_bin(1,:));
                else
                    A_dec = uhex2dec(A_bin(:,:));
                end
                ee=hex2dec(A{j,k});
                for shft = 2:3
                    inner=1;
                    while (inner <= shft)
                        if (inner == 1)
                            eee= A_dec;
                            A_b=A_bin;
                            A_sh = bitshift(uint8(A_dec),1);
                        else
                            Adh=dec2hex(eee);
                            A_b=hex2bin(Adh,4);
                            A_sh = bitshift(uint8(eee),1);
                        end
                        if(A_b(1,1)=='1' && eee>15)
                            eee=bitxor(uint8(A_sh),uint8(27));
                        else
                            eee=A_sh;
                        end
                      inner =inner + 1;
                    end
                  ee= bitxor(ee,eee);
                end
                e=ee;
            else
                A{j,k};
                A_bin = hex2bin(A{j,k},4);
                n=length(A{j,k});
                if(n==1)
                    A_dec=bin2dec(A_bin(1,:));
                else
                    A_dec = uhex2dec(A_bin(:,:));
                end
                ee=0;
                for shft = 1:3
                    for inner = 1:shft
                        inner;
                        if (inner == 1)
                            eee=A_dec;
                            A_b=A_bin;
                            A_sh = bitshift(uint8(A_dec),1);
                        else
                            Adh=dec2hex(eee);
                            A_b=hex2bin(Adh,4);
                            A_sh = bitshift(uint8(eee),1);
                        end
                        if(A_b(1,1)=='1' && eee>15)
                            eee=bitxor(uint8(A_sh),uint8(27));
                        else
                            eee=A_sh;
                        end
                    end
                  ee= bitxor(ee,eee);
                end
                e=ee;
            end
            sum = bitxor(e,sum);
        end
        inv_mc{i,k}= dec2hex(sum);
    end
end
end