include <globalSettings.scad>
include <../../lib_v2/scad/holderLL8UU_H.scad>
include <../../lib_v2/scad/endStop.scad>
include <../../lib_v2/scad/bearing.scad>

// [0] strName [1]M/2, [2]Length, [3]Diameter/2, [4]slotDiameter/2, [5]slotWidth, [6]slotDistance
// LL8UU = [4, 24, (15/2), (14.3/2), 1.1, 15.3];
//vHBHolder = ["hotBedHolder", 160, 160, 5-Mnk*2];
barHolderOX();

R = 4;
Fn = 4;
HR = 20;
M3_2 = 1.5;

bxW = 20;
bxH = vHBHolder[2]+10;
bxD = 20;

shiftHolderMotorXX=15; //difference between bar length and foundation, 25 for motor, 15 for opposite
shiftHolderX=0;

module barHolderM8X(pX=0, pY=0, pZ=0, rX=0, rY=0, rZ=0, clr="grey", _showMetall = false)
{
    translate([pX, pY, pZ])
    rotate([rX, rY, rZ])
    color(clr)
    {
        difference(){
            union(){
                cylinder(HR,2*R, 1.5*R, $fn=R*2*2*Fn);
                cylinder(HR/4, 2.3*R, 1.5*R, $fn=R*2*2*Fn);
                translate([0,0,-shiftHolderMotorXX])
                    cylinder(shiftHolderMotorXX, 2.3*R, 2.3*R, $fn=R*2*2*Fn);
            }//union
            cylinder(HR+1,R+0.2, R+0.4, $fn=R*2*Fn);
        }//diff
        translate([2*R, -2.5, -shiftHolderMotorXX])
            cube([10,5,shiftHolderMotorXX]);
        //bar in motor part
    }//transform
    
} //barHolder

module barHolderOX(pX=0, pY=0, pZ=0, rX=0, rY=0, rZ=0, showMetall = false)
{
    translate([pX, pY, pZ])
    rotate([rX, rY, rZ])
    //color(clr)
    {
        barHolderM8X(pX=0, pY=(vHBHolder[2]/2-LL8UU[1]*3), pZ=shiftHolderMotorXX, rX=0, rY=0, rZ=0, _showMetall = showMetall);        
        barHolderM8X(pY=(-vHBHolder[2]/2+LL8UU[1]*3), pZ=shiftHolderMotorXX, rX=0, rY=0, rZ=0, _showMetall = showMetall);
        endStopHolder(pX=-4, pY=(vHBHolder[2]/2)+10, pZ=shiftHolderMotorXX, rX=90, rY=0, rZ=-90, sizeY=35);
        bearing608rsHolder(pX=0, pY=0, pZ=20, rX=90, rY=-90, rZ=0);
        if(showMetall){
            endStop(pX=-11, pY=(vHBHolder[2]/2)+10, pZ=shiftHolderMotorXX, rX=90, rY=0, rZ=-90);
            //bearing608rs(pX=0, pY=0, pZ=20, rX=90, rY=-90, rZ=0);
        }
        
        difference(){
        translate([0, bxH/2, -5])
            rotate([90,0,0])
            linear_extrude(bxH)
                import("../dxf/barHolderSidev2.dxf", $fn=Fn*8);
        //holes at back
        // 1
        translate([27,(vHBHolder[2]/2-LL8UU[1]*3),-10])
            cylinder(10, M3_2+0.4, M3_2+0.4, $fn=M3_2*2*Fn);
        translate([27,(vHBHolder[2]/2-LL8UU[1]*3),-6])
            cylinder(3, M3_2*2.5, M3_2+0.4, $fn=M3_2*2*2*Fn);
        //2
        translate([27,0,-10])
            cylinder(10, M3_2+0.4, M3_2+0.4, $fn=M3_2*2*Fn);
        translate([27,0,-6])
            cylinder(3, M3_2*2.5, M3_2+0.4, $fn=M3_2*2*2*Fn);

        //3
        translate([27,(-vHBHolder[2]/2+LL8UU[1]*3),-10])
            cylinder(10, M3_2+0.4, M3_2+0.4, $fn=M3_2*2*Fn);
        translate([27,(-vHBHolder[2]/2+LL8UU[1]*3),-6])
            cylinder(3, M3_2*2.5, M3_2+0.4, $fn=M3_2*2*2*Fn);

        //holes at bottom
        //1
        translate([15,(vHBHolder[2]/2),23])
        rotate([0,90,0])
            cylinder(10, M3_2+0.4, M3_2+0.4, $fn=M3_2*2*Fn);
        translate([15,(vHBHolder[2]/2), 23])
        rotate([0,90,0])
            cylinder(3, M3_2*2.5, M3_2+0.4, $fn=M3_2*2*2*Fn);
        //2
        translate([15,(vHBHolder[2]/2-LL8UU[1]*9),23])
        rotate([0,90,0])
            cylinder(10, M3_2+0.4, M3_2+0.4, $fn=M3_2*2*Fn);
        translate([15,(vHBHolder[2]/2-LL8UU[1]*9),23])
        rotate([0,90,0])
            cylinder(3, M3_2*2.5, M3_2+0.4, $fn=M3_2*2*2*Fn);
        //3
        translate([15,0,20])
        rotate([0,90,0])
            cylinder(10, M3_2+0.4, M3_2+0.4, $fn=M3_2*2*Fn);
        translate([15,0,20])
        rotate([0,90,0])
            cylinder(3, M3_2*2.5, M3_2+0.4, $fn=M3_2*2*2*Fn);
        //4 - no place for this hole with 160x160 heatBed
        translate([15,(-vHBHolder[2]/2+LL8UU[1]*9),23])
        rotate([0,90,0])
            cylinder(10, M3_2+0.4, M3_2+0.4, $fn=M3_2*2*Fn);
        translate([15,(-vHBHolder[2]/2+LL8UU[1]*9),23])
        rotate([0,90,0])
            cylinder(3, M3_2*2.5, M3_2+0.4, $fn=M3_2*2*2*Fn);
        //5      
        translate([15,(-vHBHolder[2]/2),23])
        rotate([0,90,0])
            cylinder(10, M3_2+0.4, M3_2+0.4, $fn=M3_2*2*Fn);
        translate([15,(-vHBHolder[2]/2),23])
        rotate([0,90,0])
            cylinder(3, M3_2*2.5, M3_2+0.4, $fn=M3_2*2*2*Fn);        

        //additional hole for better holder support
        //translate([0,(-vHBHolder[2]/2+LL8UU[1]*3),-7])
        //    cylinder(HR+1,R/2+0.2, R/2+0.4, $fn=R*2*Fn);
        //translate([0,(vHBHolder[2]/2-LL8UU[1]*3),-7])
        //    cylinder(HR+1,R/2+0.2, R/2+0.4, $fn=R*2*Fn);    
        }//diff
        }//transform
}//barHolder
//barHolderOX();