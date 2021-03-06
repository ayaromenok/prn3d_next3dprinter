// holder for LL8UU
include <../../lib_v2/scad/holderLL8UU_H.scad>

Fn = gFn*4;
bTestInPlace = gbTestInPlace;

// [0] strName [1]M/2, [2]Length, [3]Diameter/2, [4]slotDiameter/2, [5]slotWidth, [6]slotDistance
// LL8UU = [4, 24, (15/2), (14.3/2), 1.1, 15.3];

module dualHolderLL8UU( _rX=0, _rY=0, _rZ=0, clr=[0.6,0.6,0.6]){
		color(clr)
		rotate([_rX, _rY, _rZ]) {
			difference(){
				union(){
					cylinder(vHotBedHolder[2], (LL8UU[3]*1.5), (LL8UU[3]*1.5), $fn=(LL8UU[3]*1.5*Fn));
					translate([-LL8UU[3], -LL8UU[3]*2, 0])
						cube([(LL8UU[3]*2), (LL8UU[3]*4), vHotBedHolder[2]]);
				}//union
				translate([0,0,-1])
					cylinder(vHotBedHolder[2]+2, LL8UU[3], LL8UU[3], $fn=(LL8UU[3]*Fn));
				translate([-LL8UU[5], (-LL8UU[3]*2-1), -1])
						cube([(LL8UU[5]*2), (LL8UU[3]*4), (vHotBedHolder[2]+2)]);
				translate([(-LL8UU[3]-1), -LL8UU[3]*1.5, (LL8UU[2]/2)])
					rotate([0,90,0])
						cylinder((LL8UU[3]*2+2), gRBHole, gRBHole, $fn=2.3*Fn);
				translate([(-LL8UU[3]-1), -LL8UU[3]*1.5, (vHotBedHolder[2]-LL8UU[2]/2)])
					rotate([0,90,0])
						cylinder((LL8UU[3]*2+2), gRBHole, gRBHole, $fn=2.3*Fn);
			}//difference
		} //rotate
}

module hotBedHolder(pX=0, pY=0, pZ=0, dispMetall = true, clr="lightgrey"){
    translate([(-vHotBedHolder[1]/2+pX), (-vHotBedHolder[2]/2+pY), pZ]){
		if (dispMetall){
			LL8UU_y(pX=(LL8UU[3]*2), clr=[0.5,1,0.5]);
			LL8UU_y(pX=(vHotBedHolder[1]-LL8UU[3]*2), clr=[0.5,1,0.5]);
			LL8UU_y(pX=(LL8UU[3]*2), pY=(vHotBedHolder[1]-LL8UU[2]), clr=[0.5,1,0.5]);
			LL8UU_y(pX=(vHotBedHolder[1]-LL8UU[3]*2), pY=(vHotBedHolder[1]-LL8UU[2]), clr=[0.5,1,0.5]);
		}//display Metall part

		color(clr)

		translate([0,0,(LL8UU[3]*2)])
			cube([vHotBedHolder[1],vHotBedHolder[2],10]);
		translate([(LL8UU[3]*2), vHotBedHolder[2], 0])
			dualHolderLL8UU(_rX=90);	
		translate([(LL8UU[3]*2+(vHotBedHolder[1]-LL8UU[3]*4)),vHotBedHolder[2],0])	
			dualHolderLL8UU(_rX=90);
	}//translate
	if (gEcho){
		if (gEchoFull){
			echo (vHotBedHolder[0], "pos:",pX, pY, pZ, "clr:", clr);
		} else {
			echo(vHotBedHolder[0]);
		}
	}
}//hot bed holder

//tests
//if (bTestInPlace){
//	hotBedHolder();
//	hotBedHolder(pX=150);
//}
