%   Advanced Encryption Standard (AES);
%   Naina - Umair 
%   Main module:
function s = main
    clc
    clear all
% -------------------------------------------------------------------------
%   Image Input:
% -------------------------------------------------------------------------
    prompt = 'Press 1-Image and 2-Block Matrix ? ';
    result = input(prompt);
    
    if(result == 1)
        Ind = 1;
        img=uigetfile();   
        A=imread(img);
        tic;
        A=imresize(A,[64,64]);
        X=A(:,:,1);
        div=4;
        [a b] = size(X) 
        for i=1:div:a
            for j=1:div:b
                X((i:i+div-1),(j:j+div-1))=AES_Encoder(X((i:i+div-1),(j:j+div-1)),Ind);
            end
        end
        en = X;

        for i=1:div:a
            for j=1:div:b
                X((i:i+div-1),(j:j+div-1))=AES_Decoder(X((i:i+div-1),(j:j+div-1)),Ind);
            end
        end  
        
        figure('Name','Encrypted Image','NumberTitle','off');
        imshow(en);
        
        figure('Name','Recovered Image','NumberTitle','off');
        imshow(X);
        
        toc;

    else
% -------------------------------------------------------------------------
%   4*4 Matrix block Input:
% -------------------------------------------------------------------------
    Ind = 0;
    tic;
    iState={
       '00','44','88','CC';
       '11','55','99','DD';
       '22','66','AA','EE';
       '33','77','BB','FF'
       };

    cipherKey={
       '00' '04' '08' '0C';
       '01' '05' '09' '0D';
       '02' '06' '0A' '0E';
       '03' '07' '0B' '0F';
       };
    
    cipherText = AES_Encoder(iState,Ind);
    plainText = AES_Decoder(cipherText,Ind);
 
    toc;
    end
end
