@lazyglobal off. 
//Launch from Kerbin. Works with boosters
clearscreen.
run functionlib.
print "loaded functions".
launchProcedure().
stagelogic().
Rocket_Ascent(90,30,75000).//(OrbitHeading,MaxAcc,TargetApo)
ProgradeStabilize().//shuts down engines
sas on.
rcs on.	
unlock all.
print " COMPLETE " at (0,1).
