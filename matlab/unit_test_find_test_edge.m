% setup a box
shape1.x = 2;            % x coordinate of the center of the box
shape1.y = 2;            % y coordinate of the center of the box
shape1.w = 4;            % width of the box
shape1.h = 4;            % height of the box
shape1.alpha = 0;        % the angle of rotation for the box
shape1.isRect = true;   % this is a box



edges = find_test_edge(shape1)
edge1 = edges(1,:);
edge2 = edges(2,:);

% this test the find_test_edge function for a box. It will return
% [-1,0] and [0,-1] which are the directional vector perpendicular to the
% edges of the box.
assert((edge1 == [-1,0] && edge2 == [0,-1]));

% set up a fan
shape2.x = 0;            % x coordinate of the center of the fan
shape2.y = 0;            % y coordinate of the center of the fan
shape2.radius = 2;       % radius of the fan
shape2.alpha1 = 0;    % starting angle                        
shape2.alpha2 = pi/2;  % ending angle
shape2.isRect = false;   % this is not a box



edges = find_test_edge(shape2)
edge1 = edges(1,:);
edge2 = edges(2,:);

% this test the find_test_edge function for a fan. It will return [-1,0]
% [-1,0] and [0,-1] which are the directional vector perpendicular to the
% straight edge of the fan.
assert((edge1 == [-1,0] && edge2 == [0,-1]));