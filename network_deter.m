function G = network_deter(G)


% G = zeros(10,10);


% then make 5 more links
% output G
pp = 1;

% while min(sum(G)) ~= 9
    

% first make sure network is connected
while min(sum(G)) == 0
    a1 = randi([1,10],1,1);
    a2 = randi([1,10],1,1);
    if a1 ~= a2
        G(a1,a2) = 1;
        G(a2,a1) = 1;
    end
end

% for sensor 1, check if connection with rest of them
if pp == 1
for ill = 2:10
   Grph = graph(G);
   path = shortestpath(Grph,1,ill);
   if isempty(path)
      G(1,ill) = 1;
      G(ill,1) = 1;
   end
end
end
% now we have a connected network.

% add one more link to the network randomly.




if min(sum(G)) ~= 9 % not fully connected network
    x1 = sum(G);
    [y1,~] = min(x1);
    while y1 ~= 9
        b1 = randi(10);
        b2 = randi(10);
        if b1 ~= b2
            if G(b1,b2) ~= 1
                G(b1,b2) = 1;
                G(b2,b1) = 1;
                pp = 2;
                break
            end
        end
    end
end



% figure
% plot(graph(G))
% title('Network Graph')
%   
end


  