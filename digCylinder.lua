-- DigCylinder program found online -- untested, dubious

args = {...}
 
radius = 15
height = 10
 
if tonumber(args[1]) ~= nil and tonumber(args[2]) ~= nil then
        radius = args[1]
        height = args[2]
end
 
xCoord = 0
zCoord = 0
yCoord = 0
 
xStartRing = 0
zStartRing = 0
 
orientation = 4
orientations = {"north", "east", "south", "west"}
 
zDiff = {-1, 0, 1, 0}
xDiff = {0, 1, 0, -1}
 
 
function left()
        orientation = orientation - 1
        orientation = (orientation - 1) % 4
        orientation = orientation + 1
        turtle.turnLeft()
end
 
 
 
function right()
        orientation = orientation - 1
        orientation = (orientation + 1) % 4
        orientation = orientation + 1
 
        turtle.turnRight()
end
 
 
 
function moveForward()
        xCoord = xCoord + xDiff[orientation]  
        zCoord = zCoord + zDiff[orientation]
 
        moved = false
        while not(moved) do
                turtle.dig()
                moved = turtle.forward()
        end
end
 
 
 
function moveUp()
        yCoord = yCoord + 1
 
        turtle.digUp()
 
        moved = false
        while not(moved) do
                moved = turtle.up()
        end  
end
 
function moveDown()
 
        yCoord = yCoord - 1
        turtle.digDown()
       
        moved = false
 
        while not(moved) do
                moved = turtle.down()
        end
 
end
 
function look(direction)
        while direction ~= orientations[orientation] do
                right()
        end
end
 
 
function round(n)
        decimal = n - math.floor(n)
        if decimal >= 0.5 then
                return math.ceil(n)
        else
                return math.floor(n)
        end
end
 
function withinRadius(x, z)
        return round( math.sqrt((x * x) + (z * z)) ) <= radius
end
 
 
function forwardWithinRadius()
 
        xNext = xCoord + xDiff[orientation]  
        zNext = zCoord + zDiff[orientation]
       
        return withinRadius(xNext, zNext)
end
 
function gotoEdge()
        while forwardWithinRadius() do
                moveForward()
        end
       
        left()
       
        xStartRing = xCoord
        zStartRing = zCoord
end
 
function digRing()
 
        repeat
               
                while forwardWithinRadius() do
                        moveForward()
                end
                while not(forwardWithinRadius()) do
                        left()
                end
                moveForward()
                right()
       
        until xCoord == xStartRing and zCoord == zStartRing
       
        left()
        left()
        for i = 1,radius do
                moveForward()
        end
        left()
        left()
end
 
function digLayer()
        r = radius
        for i = 1,r do
                radius = i
                gotoEdge()
                digRing()
        end
end
 
function digCylinder()
        for i = 1,height do
                digLayer()
                moveDown()
        end
end