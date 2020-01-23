include <LL8UUHolder.scad>
include <globalSettings.scad>
include <../../lib_v2/scad/nema17.scad>
include <../../lib_v2/scad/endStop.scad>

//for STL export - holder w/o motor should me mirrored
//mirror([1,0,0])
//axisYHolder(_showMetall = false, nema17=false);
//with Motor
//axisYHolder(_showMetall = false, nema17=true);

ayhSizeX = 20;
ayhSizeY = 25;
ayhSizeZ = 52;

module axisYHolder(pX=0, pY=0, pZ=0, rX=0, rY=0, rZ=0, clr="grey", _showMetall = false, nema17=true)
{
    translate([pX, pY, pZ])
    rotate([rX, rY, rZ])
    color(clr)
    {
        difference(){
            translate([-31,-(14+26),0])
                cube([46, 26, ayhSizeZ+3]);
            translate([-40, -(14+8), 8])
            rotate([0,90,0])
                cylinder(62, 4.6, 4.3, $fn=30);
            translate([-40, -(14+8), 48])
            rotate([0,90,0])
                cylinder(62, 4.6, 4.3, $fn=30);
            if (nema17){
                translate([-40, -(14+8+5), 14])
                    cube([62,10,28]);
            }//nema17    
            //endStop holder
            translate([-41,-33,68])
            rotate([90,90,0]){
                translate([17, 13, -1])
                    cylinder(12, 1, 1, $fn=12);
                translate([36,13,-1])
                    cylinder(12, 1, 1, $fn=12);
            }//endStopHolder
              
        }//dif
        
        if (nema17){
            nema17Holder2(pX=36, pY=-7, pZ=27.3, rX=90, rZ=-90);
            translate([11.8, -16, 0])
                    cube([3,10,45.6]);
            translate([11.8, -35, 0])
                    cube([48.5,71,3]);
            if (_showMetall){
                endStop(-15,-35, 25, 90, -90);
                nema17(pX=36, pY=-7, pZ=27, rX=90, rZ=-90);
                nema17GT2Puley(pX=36, pY=-11, pZ=27, rX=90, rZ=0);
            }
        } else {
            //buttons for axisZ endstopper
            //translate([-31,11,0])
            //    cube([5, ayhSizeY, ayhSizeZ]);
            //translate([-41,31,0])
            //    cube([10, 5, ayhSizeZ]);
        }//nema17
        difference(){
            translate([-31,-14,0])
                cube([ayhSizeX, ayhSizeY, ayhSizeZ]);
            translate([-20,0,-1])
                cylinder(ayhSizeZ+2, 4.8, 4.8, $fn=20);
            translate([-20,0,ayhSizeZ-10])
                cylinder(11, 5.4, 5.4, $fn=30);
            M8TR8Holes(pX=-20, pZ=ayhSizeZ+1, rY=180, rZ=45);
        }//diff        

            
        if (_showMetall){
            M8TR8(pX=-20, pZ=ayhSizeZ+5, rY=180, rZ=45);
        }
        LL8UUHolder(pZ=12, rY=-90, rZ=90, dispMetall = _showMetall, short=false);
        LL8UUHolder(pZ=36, rY=-90, rZ=90, dispMetall = _showMetall, short=false);
        

        if (_showMetall){
            translate([0,0,0])
                cylinder(300, 4, 4, $fn=20);
            translate([-20,0,0])
                cylinder(300, 4.4, 4.4, $fn=20);
        }//showMentall
    }//transform
}//axisYHolder


module M8TR8(pX=0, pY=0, pZ=0, rX=0, rY=0, rZ=0, clr="grey", _showMetall = false)
{
    translate([pX, pY, pZ])
    rotate([rX, rY, rZ])
    color(clr){
        difference(){
            union(){
                cylinder(15,5.1,5.1,$fn=20);
                translate([0,0,1.5])
                    cylinder(3.5,11,11, $fn=30);
            }//union
            translate([0,0,-1])
                cylinder(17,4.4,4.4,$fn=20);
            translate([8,0,0])
                cylinder(6,1.6,1.6,$fn=6);
            translate([-8,0,0])
                cylinder(6,1.6,1.6,$fn=6);
            translate([0,8,0])
                cylinder(6,1.6,1.6,$fn=6);
            translate([0,-8,0])
                cylinder(6,1.6,1.6,$fn=6);
        }//diff
            
    }//transform
}//module
    
module M8TR8Holes(pX=0, pY=0, pZ=0, rX=0, rY=0, rZ=0, clr="grey", _showMetall = false)
{
    translate([pX, pY, pZ])
    rotate([rX, rY, rZ])
    color(clr){
        translate([8,0,0])
                cylinder(10,1.3,1.3,$fn=12);
            translate([-8,0,0])
                cylinder(10,1.3,1.3,$fn=12);
            translate([0,8,0])
                cylinder(10,1.3,1.3,$fn=12);
            translate([0,-8,0])
                cylinder(10,1.3,1.3,$fn=12);
    }//transform
}//module    

hiftHolderMotorZZ = 0;
R=4;
Fn=4;
HR=10;
module barHolderM8H(pX=0, pY=0, pZ=0, rX=0, rY=0, rZ=0, clr="grey", _showMetall = false)
{
    translate([pX, pY, pZ])
    rotate([rX, rY-90, rZ])
    color(clr)
    {
        difference(){
            union(){
                cylinder(HR,1.57*R, 1.5*R, $fn=R*2*2*Fn);
                //cylinder(HR/4, 2.3*R, 1.5*R, $fn=R*2*2*Fn);
                //translate([0,0,-shiftHolderMotorZ])
                //    cylinder(shiftHolderMotorZ, 2.*R, 2.*R, $fn=R*2*2*Fn);
            }//union
            cylinder(HR+1,R+0.3, R+0.5, $fn=R*2*Fn);
        }//diff
        translate([0,0,-32])
        cylinder(32,1.57*R, 1.57*R, $fn=R*2*2*Fn);
        //bar
        if (_showMetall){
            translate([0,0,0])
                cylinder(300,4,4, $fn=5);
        }
    }//transform    
} //barHolder