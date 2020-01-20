include <LL8UUHolder.scad>
include <globalSettings.scad>

axisYHolder(_showMetall = true);
ayhSizeX = 20;
ayhSizeY = 20;
ayhSizeZ = 62;

module axisYHolder(pX=0, pY=0, pZ=0, rX=0, rY=0, rZ=0, clr="grey", _showMetall = false)
{
    translate([pX, pY, pZ])
    rotate([rX, rY, rZ])
    color(clr)
    {
        translate([-32,-ayhSizeY/2,0])
            cube([ayhSizeY, ayhSizeY, ayhSizeZ]);
        
        LL8UUHolder(pZ=12, rY=-90, rZ=90, dispMetall = _showMetall);
        LL8UUHolder(pZ=50, rY=-90, rZ=-90, dispMetall = _showMetall);
        
        barHolderM8H(pY=20);
        if (_showMetall){
            translate([0,0,0])
                cylinder(300, 4, 4, $fn=20);
            translate([-20,0,0])
                cylinder(300, 4.4, 4.4, $fn=20);
        }//showMentall
    }//transform
}//axisYHolder

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