function s = AES_Decoder(iState,Ind)
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
disp('Cipher Text:');disp(iState);disp('Cipher Key:');disp(cipherKey);
count = 9;
disp('Roundkey:');
if(Ind == 1)
    iState=addRoundKey1(iState,A{count+1});
else
     iState=addRoundKey(iState,A{count+1});
end
disp(iState);
% Shift Rows;
disp('invShift Rows:');
iState=invShiftRows(iState);
disp(iState);
% -------------------------------------------------------------------------
% Replacing SubBytes;
disp('invSubBytes:');
for i=1:4
  for j=1:4
      iState(i,j) = invSubBytes(iState{i,j});
  end
end
disp(iState);
while(count>0)
    disp('-------------------- Iteration -------------------------------');
    disp(count);
    if(count==1)
        disp('InvRoundkey:');
            iState=addRoundKey(iState,First);
        disp(iState);
    else
        disp('InvRoundkey:');
            iState=addRoundKey(iState,A{count});
        disp(iState);
    end
% -------------------------------------------------------------------------
%invMix Columns;    
    disp('invMixed Columns:');
    iState=invMixColumns(iState);
    disp(iState); 
% -------------------------------------------------------------------------       
% invShift Rows;
    disp('invShift Rows:');
    iState=invShiftRows(iState);
    disp(iState);
% -------------------------------------------------------------------------
% invSubBytes;
    disp('invSubBytes:');
    for i=1:4
        for j=1:4
            iState(i,j) = invSubBytes(iState{i,j});
        end
    end
    disp(iState);
count=count-1;
end
% -------------------------------------------------------------------------
% invRoundKey
    if(Ind == 1)
        iState=addRoundKey3(iState,cipherKey);
    else
        iState=addRoundKey(iState,cipherKey);
    end
    disp('Plain Text');
    disp(iState);
    s=iState;
end
