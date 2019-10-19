// holder for LL8UU
include <../../lib_v2/scad/globalParams.scad>
include <../../lib_v2/scad/linearBearing.scad>

Fn = gFn*4;
bTestInPlace = gbTestInPlace;

// [0]M/2, [1]Length, [2]Diameter/2, [3]slotDiameter/2, [4]slotWidth, [5]slotDistance
//LL8UU = [4, 24, (15/2), (14.3/2), 1.1, 15.3];
sizeSupportX = 100;
sizeSupportY = sizeSupportX;
module hotBedHolder(pX=0, pY=0, pZ=0){
	translate(pX,pY,pZ){
		translate([0,0,(LL8UU[2]*2)])
			cube([sizeSupportX,sizeSupportY,10]);
		for (i = [0:1]){
			translate([(LL8UU[2]*2+i*(sizeSupportX-LL8UU[2]*4)),sizeSupportY,0]) {
				rotate([90,0,0]) {
					difference(){
						union(){
							cylinder(sizeSupportY, (LL8UU[2]*1.5), (LL8UU[2]*1.5), $fn=(LL8UU[2]*1.5*Fn));
							translate([-LL8UU[2], -LL8UU[2]*2, 0])
								cube([(LL8UU[2]*2), (LL8UU[2]*4), sizeSupportY]);
						}//union
						translate([0,0,-1])
							cylinder(sizeSupportY+2, LL8UU[2], LL8UU[2], $fn=(LL8UU[2]*Fn));
						translate([-LL8UU[4], (-LL8UU[2]*2-1), -1])
								cube([(LL8UU[4]*2), (LL8UU[2]*4), (sizeSupportY+2)]);
						translate([(-LL8UU[2]-1), -LL8UU[2]*1.5, (LL8UU[1]/2)])
							rotate([0,90,0])
								cylinder((LL8UU[2]*2+2), gRBHole, gRBHole, $fn=2.3*Fn);
						translate([(-LL8UU[2]-1), -LL8UU[2]*1.5, (sizeSupportY-LL8UU[1]/2)])
							rotate([0,90,0])
								cylinder((LL8UU[2]*2+2), gRBHole, gRBHole, $fn=2.3*Fn);
					}//difference
				} //rotate
			}//translate
		}//for
	}//translate
}//hot bed holder

hotBedHolder();
//*
LL8UU_y(pX=(LL8UU[2]*2), clr=[0.5,1,0.5]);
LL8UU_y(pX=(sizeSupportX-LL8UU[2]*2), clr=[0.5,1,0.5]);
LL8UU_y(pX=(LL8UU[2]*2), pY=(sizeSupportX-LL8UU[1]), clr=[0.5,1,0.5]);
LL8UU_y(pX=(sizeSupportX-LL8UU[2]*2), pY=(sizeSupportX-LL8UU[1]), clr=[0.5,1,0.5]);
//*/
//sizeSupport
