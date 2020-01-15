include <../../lib_v2/scad/nema17.scad>
include <../../lib_v2/scad/endStop.scad>

//botZAxisHolder(showMetall = true);
//botZAxisHolder(pY=0,useEndStop=false, showMetall = false);

R=4;
Fn=4;
HR=10;
//need to check value - 30 or even more
shiftHolderMotorZ=46+32; //difference between bar length and foundation

module barHolderM8V(pX=0, pY=0, pZ=0, rX=0, rY=0, rZ=0, clr="grey", _showMetall = false)
{
    translate([pX, pY, pZ])
    rotate([rX, rY, rZ])
    color(clr)
    {
        difference(){
            union(){
                cylinder(HR,1.57*R, 1.5*R, $fn=R*2*2*Fn);
                //cylinder(HR/4, 2.3*R, 1.5*R, $fn=R*2*2*Fn);
                //translate([0,0,-shiftHolderMotorZ])
                //    cylinder(shiftHolderMotorZ, 2.*R, 2.*R, $fn=R*2*2*Fn);
            }//union
            cylinder(HR+1,R+0.2, R+0.4, $fn=R*2*Fn);
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

module holeForM3(pX=0, pY=0, pZ=0, rX=0, rY=0, rZ=0)
{
    translate([pX, pY, pZ])
    rotate([rX, rY, rZ]){
        cylinder(10, 1.9, 1.9, $fn=1.9*2*Fn);
        translate([0,0,-2.9])
            cylinder(3, 1.5*2.5, 1.9, $fn=1.9*2*2*Fn);
    }//transform
}//module hole for M3

module botZAxisHolder(pX=0, pY=0, pZ=0, rX=0, rY=0, rZ=0, clr="grey", useEndStop = true,showMetall = false)
{
    translate([pX, pY, pZ+3])
    rotate([rX, rY, rZ])
    color(clr)
    {
        barHolderM8V(pZ=shiftHolderMotorZ, _showMetall=showMetall);
        nema17Holder2(pX=-18, pY=0, pZ=43, rX=0, rY=-90, rZ=90);        
        
        if(showMetall){
            nema17(pX=-20, pY=0, pZ=43, rX=0, rY=-90, rZ=0);
            translate([-20,0,65])
                cylinder(314,4,4, $fn=5);
        }//show Metall
        if(useEndStop){
            endStopHolder(pX=0, pY=22, pZ=30, rX=90, rY=0, rZ=180, sizeY=45);
            if(showMetall){            
                endStop(pX=-0, pY=29, pZ=30, rX=90, rY=0, rZ=180);
            }//show Metall
        }//useEndStop
        
        difference(){
            translate([-40,-40,-3])            
                cube([46.3,80,3]);
            holeForM3(pX=-10,pY=-35, pZ=-2,rX=180);
            holeForM3(pX=-35,pY=-35, pZ=-2,rX=180);
            holeForM3(pX=-10,pY=35, pZ=-2,rX=180);
            holeForM3(pX=-35,pY=35, pZ=-2,rX=180);
        }//diff
        
        difference(){
            translate([3.3,-40,-18])
                cube([3,80,18]);
            holeForM3(pX=4, pY=-35, pZ=-12,rY=-90);
            holeForM3(pX=4, pY=0, pZ=-12,rY=-90);
            holeForM3(pX=4, pY=35, pZ=-12,rY=-90);
        }//diff
    }//transform
}//module botZAxisHolder    


