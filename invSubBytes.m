function inv_byte=invSubBytes(index)

SBOX={
'52' '09' '6A' 'D5' '30' '36' 'a5' '38' 'bf' '40' 'a3' '9e' '81' 'f3' 'd7' 'fb'; 
'7C' 'E3' '39' '82' '9b' '2f' 'ff' '87' '34' '8e' '43' '44' 'c4' 'de' 'e9' 'cb'; 
'54' '7B' '94' '32' 'a6' 'c2' '23' '3d' 'ee' '4c' '95' '0b' '42' 'fa' 'c3' '4e'; 
'08' '2E' 'A1' '66' '28' 'd9' '24' 'b2' '76' '5b' 'a2' '49' '6d' '8b' 'd1' '25';
'72' 'F8' 'F6' '64' '86' '68' '98' '16' 'd4' 'a4' '5c' 'cc' '5d' '65' 'b6' '92';
'6C' '70' '48' '50' 'fd' 'ed' 'b9' 'da' '5e' '15' '46' '57' 'a7' '8d' '9d' '84';
'90' 'D8' 'AB' '00' '8c' 'bc' 'd3' '0a' 'f7' 'e4' '58' '05' 'b8' 'b3' '45' '06';
'd0' '2C' '1E' '8f' 'ca' '3f' '0f' '02' 'c1' 'af' 'bd' '03' '01' '13' '8a' '6b';
'3A' '91' '11' '41' '4f' '67' 'dc' 'ea' '97' 'f2' 'cf' 'ce' 'f0' 'b4' 'e6' '73';
'96' 'AC' '74' '22' 'e7' 'ad' '35' '85' 'e2' 'f9' '37' 'e8' '1c' '75' 'df' '6e';
'47' 'F1' '1A' '71' '1d' '29' 'c5' '89' '6f' 'b7' '62' '0e' 'aa' '18' 'be' '1b';
'FC' '56' '3E' '4b' 'c6' 'd2' '79' '20' '9a' 'db' 'c0' 'fe' '78' 'cd' '5a' 'f4';
'1F' 'DD' 'A8' '33' '88' '07' 'c7' '31' 'b1' '12' '10' '59' '27' '80' 'ec' '5f';
'60' '51' '7f' 'a9' '19' 'b5' '4a' '0d' '2d' 'e5' '7a' '9f' '93' 'c9' '9c' 'ef';
'A0' 'E0' '3B' '4D' 'ae' '2a' 'f5' 'b0' 'c8' 'eb' 'bb' '3c' '83' '53' '99' '61';
'17' '2B' '04' '7E' 'ba' '77' 'd6' '26' 'e1' '69' '14' '63' '55' '21' '0c' '7d'
};
n=length(index);
if(n==1)
   value=hex2bin(index,4);
   rowIndex=0;
   colIndex=bin2dec(value(1,:));
   inv_byte=SBOX(rowIndex+1,colIndex+1);
else
   value=hex2bin(index,4);
   rowIndex=bin2dec(value(1,:));
   colIndex=bin2dec(value(2,:));
   inv_byte=SBOX(rowIndex+1,colIndex+1);
end
end