function s = AES_Encoder(iState,Ind)
cipherKey={
   '00' '04' '08' '0C';
   '01' '05' '09' '0D';
   '02' '06' '0A' '0E';
   '03' '07' '0B' '0F'
   };
% Key Generation:
%--------------------------------------------------------------------------   
Rk=keySchedule(cipherKey,1);
First=Rk;
for i= 2:10
    Rk=keySchedule(Rk,i);
    A{i}=Rk;
end
%--------------------------------------------------------------------------   
disp('Plain Text:');disp(iState);disp('Cipher Key:');disp(cipherKey);
if(Ind == 1)
    iState=addRoundKey1(iState,cipherKey);
else
    iState=addRoundKey(iState,cipherKey);
end
disp('Initial Round:');disp(iState);
% -------------------------------------------------------------------------
for iter=1:9
    disp('-------------------- Iteration -------------------------------');
    disp(iter);
% -------------------------------------------------------------------------
% Replacing SubBytes;
disp('subBytes:');
for i=1:4
    for j=1:4
        iState(i,j) = subBytes(iState{i,j});
    end
end
disp(iState);
% -------------------------------------------------------------------------
% Shift Rows;
disp('Shift Rows:');
iState=shiftRows(iState);
disp(iState);
% -------------------------------------------------------------------------
disp('Mixed Columns:');
iState=mixColumns(iState);
disp(iState);
% -------------------------------------------------------------------------
disp('Roundkey:');
    if(iter==1)
        iState=addRoundKey(iState,First);
        disp(iState);
    else
        iState=addRoundKey(iState,A{iter});
        disp(iState);
    end
end
disp('-------------------- Last Iteration -------------------------------');
disp(10);
% -------------------------------------------------------------------------
% Replacing SubBytes;
disp('subBytes:');
for i=1:4
    for j=1:4
        iState(i,j) = subBytes(iState{i,j});
    end
end
disp(iState);
% -------------------------------------------------------------------------
% Shift Rows;
disp('Shift Rows:');
iState=shiftRows(iState);
disp(iState);
% -------------------------------------------------------------------------
disp('Roundkey:');
if(Ind == 1)
    iState=addRoundKey3(iState,A{10});
else
    iState=addRoundKey(iState,A{10});
end
disp(iState);
% -------------------------------------------------------------------------
disp('Cipher Text');
disp(iState);
% -------------------------------------------------------------------------
s=iState;
end
