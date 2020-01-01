include <../../lib_v2/scad/linearBearing.scad>
include <../../lib_v2/scad/holderLL8UU.scad>


include <foundation.scad>
include <heatBed160x160.scad>
include <heatBedHolder160x160.scad>

foundation();
heatBed160x160(pZ=-50);
heatBedHolder160x160(,pZ=-20);