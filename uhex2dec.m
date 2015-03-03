function dec = uhex2dec(A)
    i=2;
    dec=0;
    l=0;
    while(i>=1)
        j=4;
        while (j>=1)
            Acv=A(i,j)-'0';
            dec= dec + (Acv*power(2,l));
            l=l+1;
            j=j-1;
        end
        i=i-1;
    end
end