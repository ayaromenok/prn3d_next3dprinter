include <../../lib_v2/scad/linearBearing.scad>
include <../../lib_v2/scad/holderLL8UU.scad>


include <foundation.scad>
include <heatBed160x160.scad>
include <heatBedHolder160x160.scad>
include <barHolder.scad>

foundation();
heatBed160x160(pZ=-60);
heatBedHolder160x160(,pZ=-19);
barHolder(pX=-219, pY=0, pZ=-20, rX=180, rY=-90);