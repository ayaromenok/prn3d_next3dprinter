// holder for LL8UU

include <../../lib_v2/scad/holderLL8UU_H.scad>
Fn = gFn*4;
bTestInPlace = gbTestInPlace;

// [0] strName [1]M/2, [2]Length, [3]Diameter/2, [4]slotDiameter/2, [5]slotWidth, [6]slotDistance
// LL8UU = [4, 24, (15/2), (14.3/2), 1.1, 15.3];

//vHBHolder = ["hotBedHolder", 160, 160];

difference(){
    union(){
        translate([-LL8UU[2]/2, 0, 0])
        rotate([0,90,0])
            cylinder(LL8UU[2], LL8UU[1]*3, LL8UU[1]*3, $fn = Fn*8);
        translate([-LL8UU[2]/2, -LL8UU[1], -LL8UU[1]*5.5])
            cube([LL8UU[2],LL8UU[1]*2,LL8UU[1]*9]);
    }

    LL8UU_x(pX=0, clr=[0.5,1,0.5]);	
    translate([-LL8UU[2]/2, 0, 0])
    rotate([0,90,0])
        cylinder(LL8UU[2], LL8UU[1]*1.5, LL8UU[1]*1.5, $fn = Fn*4);
    translate([-LL8UU[2]/2, -LL8UU[1]/4, -LL8UU[1]*6])
        cube([LL8UU[2],LL8UU[1]/2,LL8UU[1]*9]);
    translate([0, LL8UU[1]*1.5, -LL8UU[1]*4])
    rotate([90,0,0])
        cylinder(LL8UU[1]*3, 2.4, 2.4, $fn= Fn*4); //M4
}
