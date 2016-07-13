function [  ] = analyze_traffic( map_size )

[x,y] = ginput(1);

if(0<x && x<5 && map_size-5<y && y<map_size)
   % 'stop'
    
elseif(5<x && x<10 && map_size-5<y && y<map_size)
   % 'play'
elseif(0<x && x<5 && map_size-10<y && y<map_size-5)
   % 'back'
elseif(5<x && x<10 && map_size-10<y && y<map_size-5)
   % 'forward'
end
end

