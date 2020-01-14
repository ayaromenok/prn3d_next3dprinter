include <../../lib_v2/scad/nema17.scad>
include <../../lib_v2/scad/endStop.scad>

botZAxisHolder(showMetall = true);

R=4;
Fn=4;
HR=10;
shiftHolderMotorZ=46; //difference between bar length and foundation
module barHolderM8V(pX=0, pY=0, pZ=0, rX=0, rY=0, rZ=0, clr="grey", _showMetall = false)
{
    translate([pX, pY, pZ])
    rotate([rX, rY, rZ])
    color(clr)
    {
        difference(){
            union(){
                cylinder(HR,2*R, 1.5*R, $fn=R*2*2*Fn);
                cylinder(HR/4, 2.3*R, 1.5*R, $fn=R*2*2*Fn);
                translate([0,0,-shiftHolderMotorZ])
                    cylinder(shiftHolderMotorZ, 2.3*R, 2.3*R, $fn=R*2*2*Fn);
            }//union
            cylinder(HR+1,R+0.2, R+0.4, $fn=R*2*Fn);
        }//diff
        //bar
        if (_showMetall){
            translate([0,0,0])
                cylinder(300,4,4, $fn=3);
        }
    }//transform    
} //barHolder

module holeForM3(pX=0, pY=0, pZ=0, rX=0, rY=0, rZ=0)
{
    translate([pX, pY, pZ])
    rotate([rX, rY, rZ]){
        cylinder(10, 1.9, 1.9, $fn=1.9*2*Fn);
        translate([27,(-vHBHolder[2]/2+LL8UU[1]*3),-6])
            cylinder(3, 1.9*2.5, 1.9+0.4, $fn=1.9*2*2*Fn);
    }//transform
}//module hole for M3

module botZAxisHolder(pX=0, pY=0, pZ=0, rX=0, rY=0, rZ=0, clr="grey", showMetall = false)
{
    translate([pX, pY, pZ+3])
    rotate([rX, rY, rZ])
    color(clr)
    {
        barHolderM8V(pZ=shiftHolderMotorZ, _showMetall=showMetall);
        nema17Holder(pX=-32, pY=0, pZ=43, rX=0, rY=-90, rZ=180);        
        endStopHolder(pX=0, pY=25, pZ=30, rX=90, rY=0, rZ=180, sizeY=45);
        if(showMetall){
            nema17(pX=-32, pY=0, pZ=43, rX=0, rY=-90, rZ=0);
//            nema17GT2Puley(pX=-8, pY=-11, pZ=21.2, rX=0, rY=0, rZ=90);        
            endStop(pX=-0, pY=32, pZ=30, rX=90, rY=0, rZ=180);
        }
    }//transform
}//module botZAxisHolder    


translate([-61,-50,0])
    cube([70,100,3]);
translate([9,-50,-15])
cube([3,100,18]);