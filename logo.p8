pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
tick=0

function _update()

end

function _draw()
    if (tick==0) then 
        draw_logo()
    end
    if tick>30 then
      cls()
    end
    tick+=1
end

function draw_logo() 
  cls()
  bgcol=0
  rectfill(0,0,128,128,bgcol)
  for deg=-0.2,0.6,0.01 do
    x=sin(deg)
    y=cos(deg)
    circfill(64+x*40,64+y*40,8,9)
  end
  rectfill(80,65,128,74,bgcol)
  gr=1
  for x=32,98 do
      y=128-x
      if x>58 then
        gr=3
      end
      if x>60 then
        gr=6
      end
      circfill(x,y,gr,9)
  end
  
  for x=98,108 do
      y=x-78
      circfill(x,y,3,9)
  end
  
  function borderfill(col)
    for x=1,128 do
      for y=1,128 do
        if (pget(x,y)==0 and
           neighbour(x,y,9)>0) then
           pset(x,y,col)
        end
      end
    end
  end
  
  function neighbour(x,y,col)
      if (pget(x-1,y)!=col and
          pget(x+1,y)!=col and
          pget(x,y-1)!=col and
          pget(x,y+1)!=col) then
        return 0
      else
        return 1
      end
  end
  
  circfill(100,37,2,9)
  
  borderfill(7)
  
  print("etilmercurio games",30,64,7)
  print("presenta",45,80,7)
end
