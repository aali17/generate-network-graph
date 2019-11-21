function G = network_degree(d,numsens)
%%% This function creates a network with same degree at all nodes (we say
%%% degree of the network). Input "numsens" represents number of nodes at 
%%% the network and "d" represents degree of the network. and returns graph
%%% G.

G = zeros(numsens,numsens);

for i = 1:1:numsens
    counter = 0;
    while sum(G(i,:)) < d
        s = sum(G,1);
        [a,~] = min(s);
        B = s == a;
        loc = find(B);
        select = randi([1,length(loc)],1,1);
        r = loc(select);
        if i ~= r
            G(i,r) = 1;
            G(r,i) = 1;
        end
        counter = counter + 1;
        if counter >= 20
            i = i-1;
            break
        end
    end
end
end