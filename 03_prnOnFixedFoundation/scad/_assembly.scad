include <../../lib_v2/scad/linearBearing.scad>
include <../../lib_v2/scad/holderLL8UU.scad>


include <foundation.scad>
include <heatBed160x160.scad>
include <heatBedHolder160x160.scad>
include <barHolder.scad>
include <barHolderOppositeX.scad>
include <bottomSideHolder.scad>

foundation();
//heatBed160x160(pX=-120, pZ=-60);
heatBedHolder160x160(pX=-80, pZ=-19, clr="red");
barHolder(pX=-219, pY=0, pZ=-20, rX=180, rY=-90, showMetall=true);
barHolderOX(pX=219, pY=0, pZ=-20, rX=180, rY=-90, rZ=180, showMetall=true);

topSideHolder(pY=-216, pZ=-350, rX=-90);
topSideHolder(pY=200, pZ=-350, rX=-90);

//bottomHolders
botSideHolder(pX=190, pY=-216, pZ=10, rX=-90, _showMetall=true);
mirror([0,1,0])
    botSideHolder(pX=190, pY=-216, pZ=10, rX=-90, _showMetall=true);
mirror([0,1,0])
    botSideHolder(pX=-190, pY=216, pZ=10, rX=-90, rZ=180, _showMetall=true);
botSideHolder(pX=-190, pY=216, pZ=10, rX=-90, rZ=180, _showMetall=true);