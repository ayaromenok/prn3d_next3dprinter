include <../../lib_v2/scad/linearBearing.scad>
include <../../lib_v2/scad/holderLL8UU.scad>


include <foundation.scad>
include <heatBed160x160.scad>

foundation();
//vHotBedHolder = ["hotBedHolder", 100, 100];
hotBedHolder(pZ=20);
heatBed160x160(pZ=50);