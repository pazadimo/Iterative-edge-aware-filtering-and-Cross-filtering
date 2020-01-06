function [image1_horizon, image1_vertical, image2,image5, image_out] = ApplySpatialFilter(image,h_horizon,h_vertical, lambda,W, FinalIteration)
Size=size(image);
I=image;
image_next=(image);
image_pre= (image);
%lambda=1;
for iteration=1:1:FinalIteration
for j=1:1:Size(1)
    for i=1:1:Size(2)
       temp1=0;
       temp2=0;
       temp3=0;
       for z= -W:1:W
            if(z < 0)
                
                if(i+z > 0)
                    temp1 =temp1+ h_horizon(j,i,z+W+1)*image_pre(j,i+z,1);
                    temp2 =temp2+ h_horizon(j,i,z+W+1)*image_pre(j,i+z,2);
                    temp3 =temp3+ h_horizon(j,i,z+W+1)*image_pre(j,i+z,3);
                end
            end
            if(z==0)
                temp1 =temp1+ h_horizon(j,i,W+1)*image_pre(j,i,1);
                temp2 =temp2+ h_horizon(j,i,W+1)*image_pre(j,i,2);
                temp3 =temp3+ h_horizon(j,i,W+1)*image_pre(j,i,3);
            end
            if(z>0)
                
                if(i+z < (Size(2)+1))
                    temp1 =temp1+ h_horizon(j,i,z+W+1)*image_pre(j,i+z,1);
                    temp2 =temp2+ h_horizon(j,i,z+W+1)*image_pre(j,i+z,2);
                    temp3 =temp3+ h_horizon(j,i,z+W+1)*image_pre(j,i+z,3);
                end
            end
       end
       %disp(temp1)
       image_next(j,i,1) = temp1+ lambda*h_horizon(j,i,W+1)*((image(j,i,1))-image_pre(j,i,1));
       image_next(j,i,2) = temp2+ lambda*h_horizon(j,i,W+1)*((image(j,i,2))-image_pre(j,i,2));
       image_next(j,i,3) = temp3+ lambda*h_horizon(j,i,W+1)*((image(j,i,3))-image_pre(j,i,3));
    end
end

%%%%%
image_pre=image_next;

if(iteration == 1)
    image1_horizon=image_next;
end
for i=1:1:Size(2)
    for j=1:1:Size(1)
       temp1=0;
       temp2=0;
       temp3=0;
       for z= -W:1:W
            if(z < 0)
                if(j+z > 0)
                    temp1 =temp1+ h_vertical(j,i,z+W+1)*image_pre(j+z,i,1);
                    temp2 =temp2+ h_vertical(j,i,z+W+1)*image_pre(j+z,i,2);
                    temp3 =temp3+ h_vertical(j,i,z+W+1)*image_pre(j+z,i,3);
                end
            end
            if(z==0)
                temp1 =temp1+ h_vertical(j,i,W+1)*image_pre(j,i,1);
                temp2 =temp2+ h_vertical(j,i,W+1)*image_pre(j,i,2);
                temp3 =temp3+ h_vertical(j,i,W+1)*image_pre(j,i,3);
            end
            if(z>0)
                if(j+z < (Size(1)+1))
                    temp1 =temp1+ h_vertical(j,i,z+W+1)*image_pre(j+z,i,1);
                    temp2 =temp2+ h_vertical(j,i,z+W+1)*image_pre(j+z,i,2);
                    temp3 =temp3+ h_vertical(j,i,z+W+1)*image_pre(j+z,i,3);
                end
            end
       end
       %disp(temp1)
       image_next(j,i,1) = temp1+ lambda*h_vertical(j,i,W+1)*((image(j,i,1))-image_pre(j,i,1));
       image_next(j,i,2) = temp2+ lambda*h_vertical(j,i,W+1)*((image(j,i,2))-image_pre(j,i,2));
       image_next(j,i,3) = temp3+ lambda*h_vertical(j,i,W+1)*((image(j,i,3))-image_pre(j,i,3));
    end
end
image_pre=image_next;


if(iteration == 1)
    image1_vertical=image_next;
end
if(iteration == 2)
    image2=image_next;
end
if(iteration == 5)
    image5=image_next;
end

%figure, imshow(image_next-image);
%figure, imshow(image_next);
end
image_out=image_next;
