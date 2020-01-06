function [h_horizon,h_vertical] = FilterGen(image, W)
    Size=size(image);
permeabilityP_horizon = ones(Size(1),(Size(2)));
permeabilityP_vertical = ones((Size(1)),(Size(2)));

permeabilityP_horizon = 1-3*permeabilityP_horizon./20;
permeabilityP_vertical = 1-3*permeabilityP_vertical./20;

alpha=2;
sigma=0.5;
p=zeros(1,3);
p_prime=zeros(1,3);
for j=1:1:Size(1)
    for i=1:1:Size(2)
        if(i ~= (Size(2)) )
            %i
            p(1)=image(j,i,1);
            p(2)=image(j,i,2);
            p(3)=image(j,i,3);
            p_prime(1)=image(j,i+1,1);
            p_prime(2)=image(j,i+1,2);
            p_prime(3)=image(j,i+1,3);
            permeabilityP_horizon(j,i) = 1.0/(1+(norm((p-p_prime)./sigma,2)).^alpha);
        end
    end
end
for i=1:1:Size(2)
    for j=1:1:Size(1)
        if(j ~= (Size(1)) )
            p(1)=image(j,i,1);
            p(2)=image(j,i,2);
            p(3)=image(j,i,3);
            p_prime(1)=image(j+1,i,1);
            p_prime(2)=image(j+1,i,2);
            p_prime(3)=image(j+1,i,3);
            permeabilityP_vertical(j,i) = 1.0/(1+(norm((p-p_prime)./sigma,2)).^alpha);
        end
    end
end

%%%%%%
%W=5;
pi_horizon=zeros(Size(1),(Size(2)),2*W+1);
pi_vertical=zeros(Size(1),(Size(2)),2*W+1);
for j=1:1:Size(1)
    for i=1:1:Size(2)
        pi_left=1;
        pi_right=1;
        for z= 0:-1:-W
            if(z < 0)
                if(i+z > 0)
                    pi_left = pi_left*permeabilityP_horizon(j,i+z);
                
            
                    pi_horizon(j,i,z+W+1) = pi_left*permeabilityP_horizon(j,i);
                end
            end
            pi_horizon(j,i,W+1)=1;
        end
        for z= 0:1:W
            if(z>0)
                if(i+z < (Size(2)+1))
                    pi_right = pi_right*permeabilityP_horizon(j,i+z);
                
            
                    pi_horizon(j,i,z+W+1) = pi_right*permeabilityP_horizon(j,i);
                end
            end
            pi_horizon(j,i,W+1)=1;
        end
        
    end
end


%%%%%%%%%%%%%%%%%%%
for i=1:1:Size(2)
    for j=1:1:Size(1)
        pi_up=1;
        pi_down=1;
        for z= 0:-1:-W
            if(z < 0)
                if(j+z > 0)
                    pi_up = pi_up*permeabilityP_vertical(j+z,i);
                
            
                    pi_vertical(j,i,z+W+1) = pi_up*permeabilityP_vertical(j,i);
                end
            end
            pi_vertical(j,i,W+1)=1;
        end
        for z= 0:1:W
            if(z>0)
                if(j+z < (Size(1)+1))
                    pi_down = pi_down*permeabilityP_vertical(j+z,i);
                
            
                    pi_vertical(j,i,z+W+1) = pi_down*permeabilityP_vertical(j,i);
                end
            end
            pi_vertical(j,i,W+1)=1;
        end
        
    end
end

h_horizon = pi_horizon./sum(pi_horizon,3);
h_vertical = pi_vertical./sum(pi_vertical,3);

%h_horizon= permeabilityP_horizon;
%h_vertical= permeabilityP_vertical;
end