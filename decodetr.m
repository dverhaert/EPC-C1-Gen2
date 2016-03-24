clear all
load signal




trmin = 0.6;
trth = 0.62;

tr_prev_state = -1;
tr_edge_counter = 1;
tr_time = 10;
tr_time_out = 100;
tr_v_time = 20;



tr_start = 2785;
tr_stop = 4900;


tr_data_index = 1;

prev_state = -1;
counter = 0;

edge_counter = 1;
data_index = 1;
delimiter_length = 100;
threshold_time = 60;
time_out = 200;
tr_data(1) = -1;

for i=tr_start:length(signal)
   if signal(i) < trmin 
       sig3(i) = -1;
       if tr_prev_state ~= -1
            tr_edge_loc(tr_edge_counter) = i;
            tr_edge_polarity(tr_edge_counter) = -1;
            tr_edge_counter = tr_edge_counter + 1;
            tr_prev_state = -1;           
       end
   elseif signal(i) < trth
       sig3(i) = 0;
       if tr_prev_state ~= 0
            tr_edge_loc(tr_edge_counter) = i;
            tr_edge_polarity(tr_edge_counter) = 0;
            tr_edge_counter = tr_edge_counter + 1;
            tr_prev_state = 0;           
       end
   else
       if tr_prev_state ~= 1
            tr_edge_loc(tr_edge_counter) = i;
            tr_edge_polarity(tr_edge_counter) = 1;
            tr_edge_counter = tr_edge_counter + 1;
            tr_prev_state = 1;           
       end
       sig3(i) = 1;
   end
end

pol = 0;

for i=2:(tr_edge_counter-1)

            if tr_edge_polarity(i) == pol 
                if (tr_edge_loc(i) - tr_edge_loc(i - 1)) < tr_time
                    tr_data(tr_data_index) = 0;
                    tr_data_index = tr_data_index + 1;
                elseif (tr_edge_loc(i) - tr_edge_loc(i - 1)) < tr_time_out    
                    tr_data(tr_data_index) = 1;
                    tr_data_index = tr_data_index + 1; 
                    if pol == 1
                         pol = 0;
                    else
                        pol = 1;
                    end
                
                end
            end

end

disp(tr_data);