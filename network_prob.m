function G = network_prob(p,numsens)
%%% this function generates a random connected network with probability "p"
%%% at all possible edges for "numsens" number of nodes. Basically, it gives a symmetric matrix
%%% with size [numsens,numsens].
G = zeros(numsens,numsens);

while min(sum(G)) == 0
  for s = 1:1:numsens
      for sen = 1:1:numsens
         if s ~= sen
            % connect sen and s with prob 0.1
            if rand(1) <= p
               G(sen,s) = 1;
               G(s,sen) = 1;
            end
         end
      end
  end
end  

end  

