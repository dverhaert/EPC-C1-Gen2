
function packettype(array)
if (array(1) == 0) && (array (2) == 0) 
    y = ['QueryRep. The other data bits are: ', num2str(array(3:4))];
    disp(y);
elseif (array(1) == 0) && (array (2) == 1) 
    y = ['ACK. The other data bits are: ', num2str(array(3:18))];
    disp(y);
    %disp(array(2):array(18));
elseif (array(1) == 1) && (array (2) == 0) && (array(3) == 0) && (array (4) == 0)
    y = ['Query. The other data bits are: ', num2str(array(5:22))];
    disp(y);
elseif (array(1) == 1) && (array (2) == 0) && (array(3) == 0) && (array (4) == 1)
    y = ['QueryAdjust. The other data bits are: ', num2str(array(5:9))];
    disp(y);
elseif (array(1) == 1) && (array (2) == 0) && (array(3) == 1) && (array (4) == 0)
    y = ['Select. The other data bits are: ', num2str(array(5:100))];
    disp(y);
elseif (array(1) == 1) && (array (2) == 0) && (array(3) == 1) && (array (4) == 1)
    disp('Reserved for future use');
elseif (array(1) == 1) && (array (2) == 1) && (array(3) == 0) && (array (4) == 0) && (array(5) == 0) && (array (6) == 0) && (array(7) == 0) && (array (8) == 0) 
    disp('NAK')    
elseif (array(1) == 1) && (array (2) == 1) && (array(3) == 0) && (array (4) == 0) && (array(5) == 0) && (array (6) == 0) && (array(7) == 0) && (array (8) == 1) 
    y = ['Req_RN. The other data bits are: ', num2str(array(2:40))]; 
    disp(y);
elseif (array(1) == 1) && (array (2) == 1) && (array(3) == 0) && (array (4) == 0) && (array(5) == 0) && (array (6) == 0) && (array(7) == 1) && (array (8) == 0) 
    y = ['Read. The other data bits are: ', num2str(array(9:100))]; 
    disp(y);
elseif (array(1) == 1) && (array (2) == 1) && (array(3) == 0) && (array (4) == 0) && (array(5) == 0) && (array (6) == 0) && (array(7) == 1) && (array (8) == 1) 
    y = ['Write. The other data bits are: ', num2str(array(9:100))]; 
    disp(y); 
else
    disp('Unknown preamble'); 
end
end


        