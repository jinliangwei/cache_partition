ll_misses=[1332625, 226713, 1726562;
           73347, 226713, 484517;
           1332625, 93957, 1523781;
           73347, 93957, 327396;
           1332625, 570295, 2544265;
           226713, 93957, 545697;
           1332625, 187496, 2520213;
           1087604, 570295, 2044332];
   
[n_rows, n_cols] = size(ll_misses);
hold on;

idx = 0.4;
width = 0.4;
dist = 0.4;
for x= 1:1:n_rows
    bar(idx, ll_misses(x, 1), width, 'y');
    idx = idx + dist;
    bar(idx, ll_misses(x, 2), width, 'g');
    idx = idx + dist;
    bar(idx, ll_misses(x, 1) + ll_misses(x, 2), width, 'm');
    idx = idx + dist;
    bar(idx, ll_misses(x, 3), width, 'r');
    idx = idx + dist*3;
end
 
        
   