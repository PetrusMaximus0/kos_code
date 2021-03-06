clearscreen.
set ship:control:pilotmainthrottle to 0.
lock throttle to 0.
SAS off.
rcs on.
lock DeltaV to nextnode:deltav:mag.
set BurnTime to .5*DeltaV*mass/availablethrust.
lock steering to LOOKDIRUP(nextnode:burnvector,facing:topvector).
print "Aligning with Maneuver Node".
until VANG(ship:facing:vector,nextnode:burnvector) < 1 {
	print "Direction Angle Error = " + round(VANG(ship:facing:vector,nextnode:burnvector),1) + "   "at(0,1).
}
clearscreen.
print "Warping to Node".
print "Burn Starts at T-minus " + round(BurnTime,2) + "secs   ".
warpto(time:seconds + nextnode:eta - BurnTime - 10).
wait until BurnTime >= nextnode:eta.

clearscreen.
//lock throttle to DeltaV*mass/availablethrust.

print "Executing Node".

until DeltaV <= .1 {
	if VANG(ship:facing:vector,nextnode:burnvector) < 1 {
		lock throttle to DeltaV*mass/availablethrust.
	}else{
		lock throttle to 0.
	}
	print "Delta V = " + round(DeltaV,1) + "   " at(0,1).
	print "Throttle = " + MIN(100,round(throttle*100)) + "%   " at(0,2).
}
lock throttle to 0.
unlock all.
rcs off.
sas on.
remove nextnode.
clearscreen.
print "Node Executed".