﻿%%
%% M I Jubair
%%

function midpointAlgo()
midpPointLine(2, 2, 6, 8);
end

function midpPointLine(x0, y0, x1, y1)

%% checking for which octant
oct = whichOctant(x0, y0, x1, y1);
disp(['Octant:', num2str(oct)]);

%% Necessary modifications for octant 2 and 6

if (oct == 2)
    [x0, y0] = swap(x0, y0);
    [x1, y1] = swap(x1, y1);
    
elseif (oct == 3)
    x0 = -x0;
    x1 = -x1;
    [x0, y0] = swap(x0, y0);
    [x1, y1] = swap(x1, y1);

elseif (oct == 4)
    x0 = -x0;
    x1 = -x1;
    
elseif (oct == 5)
    x0 = -x0;
    x1 = -x1;
    y0 = -y0;
    y1 = -y1;
    
elseif (oct == 6)
	%% Do it by yourself

elseif (oct == 7)
	%% Do it by yourself
    
elseif (oct == 8)
	%% Do it by yourself
end

%% Initialization

x = x0;
y = y0;

dx = x1-x0;
dy = y1-y0;
d = 2*dy-dx;
dE = 2*dy;
dNE = 2*(dy-dx);

%% Plotting according to octant
[xp, yp] = linePoints(oct, x, y);
figure; 
plot(xp, yp, 'ok');
%%
hold on;
pix = '     ';
disp('moves x  y  d');
disp('-----------')
disp([pix, num2str([xp yp d])]);



while (x<x1)
    if d<=0
        d = d+dE;
        pix = 'E   ';
    else
        y = y+1;
        d = d+dNE;
        pix = 'NE  ';
    end
    x=x+1;
    [xp, yp] = linePoints(oct, x, y);
    plot(xp, yp, 'ok');
    hold on;
    disp([pix, num2str([xp yp d])]);
end
hold off;
grid on;
axis equal;
end

%% Swap (x,y)
function [a, b] = swap(a, b)
temp=a;
a=b;
b=temp;
end


%% Which octant?
function oct = whichOctant(x0, y0, x1, y1)

m = (y1-y0)/(x1-x0);

if (m>=0 && m<=1 && x0<x1)
    oct = 1;
elseif (m>1 && y0<y1)
    oct = 2;
elseif (m<-1 && y0<y1)
    oct = 3;
elseif (m<=0 && m>=-1 && x1<x0)
    oct = 4;
elseif (m>0 && m<=1 && x1<x0)
    oct = 5;
elseif (m>1 && y1<y0)
    oct = 6;
elseif (m<-1 && y1<y0)
    oct = 7;
elseif (m<0 && m>=-1 && x0<x1)
    oct = 8;
else
    oct = 1;
end

end


%% Plot accordingly
function [xp, yp] = linePoints(oct, x, y)

if (oct == 2)
    xp=y;
    yp=x;
elseif (oct== 3)
    xp=-y;
    yp=x;
elseif (oct== 4)
    xp=-x;
    yp=y;
elseif (oct== 5)
    xp=-x;
    yp=-y;
elseif (oct== 6)
%% Do it by yourself
elseif (oct== 7)
%% Do it by yourself
elseif (oct== 8)
%% Do it by yourself
else
%% Do it by yourself
end

end