function [total_infected] = independent_cascade(G,active_rounds,initial_nodes,activation_probability)
%G-Graph Data Structure
%active rounds-number of active rounds to run the diffusion process for
%initial_nodes-seeds for activation
%activation probability

active_nodes=initial_nodes;
G_duplicate=G;
prev_length=0;
edges=0;
round=1 ;
 while((length(active_nodes)~=prev_length) && length(active_nodes)~=size(G.Nodes,1) )
% for i=1:active_rounds
    if round==1
        active_nodes_last_round=active_nodes;
    else
        active_nodes_last_round=active_nodes_current_round;
    end
    active_nodes_current_round=[];
    prev_length=length(active_nodes)
    for individual = 1:length(active_nodes_last_round)
    
        potential_infected=neighbors(G_duplicate,active_nodes_last_round(individual));
        Acommon = intersect(potential_infected,active_nodes);
           potential_infected = setxor(potential_infected,Acommon);
        for victim = 1:length(potential_infected)
            temp=rand;
            if(activation_probability>temp)
                active_nodes_current_round=[active_nodes_current_round;potential_infected(victim)];
                edges=edges+1;
                 G_duplicate=G_duplicate.rmedge(active_nodes_last_round(individual),potential_infected(victim));

            else
                edges=edges+1;
                G_duplicate=G_duplicate.rmedge(active_nodes_last_round(individual),potential_infected(victim));
            end
            
            
             
        end
    end
    active_nodes=[active_nodes;unique(active_nodes_current_round)];
    length(active_nodes);
    round=round+1;
 end
total_infected=size(active_nodes,1);
