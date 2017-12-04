function [active_nodes] = independent_cascade(G,active_rounds,initial_nodes,activation_probability)
%G-Graph Data Structure
%active rounds-number of active rounds to run the diffusion process for
%initial_nodes-seeds for activation
%activation probability

active_nodes=initial_nodes;
G_duplicate=G;
prev_length=0;
while((length(active__nodes)~=prev_length) || length(active_nodes)==size(G.Nodes,1) )
    active_nodes_append=[];
    prev_length=length(active_nodes);
    for individual = 1:length(active_nodes)
    
        potential_infected=neighbors(G_duplicate,active_nodes(individual));
        Acommon = intersect(potential_infected,active_nodes);
           potential_infected = setxor(potential_infected,Acommon);
        for victim = 1:length(potential_infected)
            temp=rand;
            if(activation_probability>temp)
                active_nodes_append=[active_nodes_append;potential_infected(victim)];
            else
                G_duplicate=G.rmedge(active_nodes(individual),potential_infected(victim));
            end
            
            
             
        end
    end
    active_nodes=[active_nodes;active_nodes_append];
end
