include <../../lib_v2/scad/linearBearing.scad>
include <../../lib_v2/scad/holderLL8UU.scad>


include <foundation.scad>
include <heatBed160x160.scad>
include <heatBedHolder160x160.scad>
include <barHolder.scad>
include <barHolderOppositeX.scad>

foundation();
//heatBed160x160(pX=-120, pZ=-60);
heatBedHolder160x160(pX=-80, pZ=-19, clr="red");
barHolder(pX=-219, pY=0, pZ=-20, rX=180, rY=-90, showMetall=true);
barHolderOX(pX=219, pY=0, pZ=-20, rX=180, rY=-90, rZ=180, showMetall=true);