function result_vector = find_axis_sector_box( sector, box ) 
% This function computes the vector from the center of the sector (fan 
% shape) to the closest vertex of the box.
% input:
%   sector: The shape data of the sector. Contains following members:
%           x: the x coordinate of the center of the sector 
%           y: the y coordinate of the center of the sector
%           alpha1: the starting angle
%           alpha2: the ending angle
%           radius: the radius of the fan
%   box: The shape data of the box. Contains following members:
%           x: the x coordinate of the center of the box
%           y: the y coordinate of the center of the box
%           w: the width of the box
%           h: the height of the box 
%           alpha: the orientation of the box represented by a 2d angle in 
%                   radian with respect to the x axis  
% output:
%   result_vector: the vector from the center of the sector to the 
%   closest vertex of the box.

    % calculate vertex
    x = box.x;
    y = box.y;
    w = box.w;
    h = box.h;
    alpha = box.alpha;
    
    % setting up box vertices
    vertices_x_box =[0.5*w 0.5*w -0.5*w -0.5*w];
    vertices_y_box =[0.5*h -0.5*h -0.5*h 0.5*h]; 

    % transforming vertices into world frame
    % rotate the vertices by alpha
    vertices_box = [vertices_x_box; vertices_y_box];
    vertices_world =[cos(alpha) -sin(alpha);sin(alpha) cos(alpha)] * vertices_box;
    % shift the vertices by (x,y)
    vertices_world(1,:)= vertices_world(1,:)+x;
    vertices_world(2,:)= vertices_world(2,:)+y;
    
    % get center of the sector
    sector_x = sector.x;
    sector_y = sector.y;
    
    % find the vertex of the box that is closest to the center of the
    % sector
    min_dist = inf;
    min_i = 0;
    [dim vertice_num] = size(vertices_world)
    for i = 1:vertice_num
       dist = norm([sector_x; sector_y] - vertices_world(:,i));
       if(dist < min_dist)
           min_dist = dist;
           min_i = i;
       end
    end
    
    % compute the result axis
    result_vector = [sector_x; sector_y] - vertices_world(:,min_i);
    result_vector = result_vector';

end