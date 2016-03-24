clear all
load signal
th = 0.4;

time_count= 60;
symbol_count = 1;


trmin = 0.6;
trth = 0.62;


prev_state = -1;
counter = 0;

edge_counter = 1;
data_index = 1;
delimiter_length = 100;
threshold_time = 60;
time_out = 200;
tr_data(1) = -1;


start = 5100;
stp = 9500;



for i=1:length(signal)
   if signal(i) > th
       sig2(i) = 1;
   else
       sig2(i) = 0;
   end
end

%detect edges

for i=start:stp
   if signal(i) > th && prev_state ~= 1
       edge_loc(edge_counter) = i;
       edge_polarity(edge_counter) = 1;
       edge_counter = edge_counter + 1;
       prev_state = 1;
   elseif signal(i) < th && prev_state ~= 0
       edge_loc(edge_counter) = i;
       edge_polarity(edge_counter) = 0;
       edge_counter = edge_counter + 1;
       prev_state = 0;
   end
end

%% loop over edges


state = 0; % 0 - find delimiter, 1 - step over preamble / sync, 2 - extract bits

for i=2:(edge_counter-1)
    switch state
        case 0
            if edge_polarity(i) == 1 && (edge_loc(i) - edge_loc(i - 1)) > delimiter_length %found a delimiter,
                counter = 4;
                state = 1;  
            end
        case 1 % skip edges
            counter = counter - 1;
            if counter == 0
                state = 2;
            end
        case 2
            if edge_polarity(i) == 0 
                if (edge_loc(i) - edge_loc(i - 1)) < threshold_time
                    data(data_index) = 0;
                    data_index = data_index + 1;
                elseif (edge_loc(i) - edge_loc(i - 1)) < time_out    
                    data(data_index) = 1;
                    data_index = data_index + 1; 
                else
                  %  disp(data);
                   % packettype(data);
                    data_index = 1;
                    state = 0;
                    break;
                end
            end
    end
  
end

packettype(data);




















%detect and extract preamble / sync detect delimiter - signal stays low
%for a certain time

for i=1:length(sig2)
   if sig2(i) == 0
       counter = counter + 1;
   else
       if counter > 0        %reset counter, verify the symbol
           if counter > delimiter_length     %pulse was a delimiter
                symbol(symbol_count) = 1;
           else
               symbol(symbol_count) = 0;
           end
           symbol_count = symbol_count + 1;
           counter = 0;
       end
   end
end



%decode bits until signals stays too long above treshold


for i=1:length(sig2)
   if sig2(i) == 1
       counter = counter + 1;
   else
       if counter > 0        %reset counter, verify the symbol
           if counter > time_count
                symbol(symbol_count) = 1;
           else
               symbol(symbol_count) = 0;
           end
           symbol_count = symbol_count + 1;
           counter = 0;
       end
   end
end



%strip signal and start decoding the t->r message

%if preamble/sync is detected start over.





























