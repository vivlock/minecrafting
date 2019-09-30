-- Ideally, we'll have the same (or better) check in actions
-- When inventory full, return and unload
-- When fuel low, return, unload, and wait for fuel
-- Possibly build in charger capability -- if charging at origin, await charge and then continue

--[[
Lua ref http://tylerneylon.com/a/learn-lua/
Turtle API https://computercraft.info/wiki/Turtle_(API)

Midpoint Circle Algorithm

Calculates in the first octant, and then we can mirror them across all octants

For any given pixel (x, y), the next pixel to be plotted is either (x, y + 1) or (x - 1, y + 1). This can be decided by the following steps:
1. Find midpoint p of the two possible pixels (x - 0.5, y + 1)
2. If p lies inside or on the circle perimeter, plot (x, y + 1). Otherwise, if it's outside, plot (x - 1, y + 1)

Whether midpoint is inside or outside the circle can be determined by the following formula:

  Given a circle centered at (0,0) and radius r, and point p(x, y)
  F(p) = x^2 + y^2 - r^2

  If F(p) < 0, the point is inside the circle

  If F(p) = 0, the point is on the perimeter

  If F(p) > 0, the point is outside the circle

https://www.geeksforgeeks.org/mid-point-circle-drawing-algorithm/

I want to initially calculate the perimeter of the circle and store it in Turtle's memory. Then each pass should be very like the excavate loop, 
except that we will only dig spaces that are within the perimeter

I think the best origin point will be the center of one side, so the return point chest/charger won't get dug out, or the complexity of figuring out a "corner"


]]--