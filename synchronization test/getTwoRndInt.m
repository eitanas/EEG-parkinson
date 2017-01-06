function [r1,r2] = getTwoRndInt(maxI)
rng(5)

r1 = randi(maxI)
r2 = randi(maxI)
 while r1==r2
   r2 = randi(intI)  
 end
 
end