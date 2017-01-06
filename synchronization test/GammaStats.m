function gamma_v = GammaStats(data1,data2,BW1,BW2,params,st_t,end_t)

start_time = st_t;
end_time = end_t;

rng(0)
gamma_v = 0;

for i=1:30
    for j=i+1:30
        
        s1 = get_signal_interval(data1,BW1,i,params,start_time,end_time);
        s2 = get_signal_interval(data2,BW2,j,params,start_time,end_time);
        
        g = Gamma(s1,s2);
        gamma_v = [gamma_v, g];
        
    end
end


histogram(gamma_v,50)
mean(gamma_v)

end