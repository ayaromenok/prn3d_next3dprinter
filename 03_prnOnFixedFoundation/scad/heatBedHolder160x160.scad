// holder for LL8UU

include <../../lib_v2/scad/holderLL8UU_H.scad>
include <LL8UUHolder.scad>
include <globalSettings.scad>

Fn = gFn*4;
bTestInPlace = gbTestInPlace;
Mnk = gMnk;
M_2 = 2.4+Mnk;
sideDistX = 5; // distance from side to support hole
sideDistY = 5; // distance from side to support hole
// [0] strName [1]M/2, [2]Length, [3]Diameter/2, [4]slotDiameter/2, [5]slotWidth, [6]slotDistance
// LL8UU = [4, 24, (15/2), (14.3/2), 1.1, 15.3];

//vHBHolder = ["hotBedHolder", 160, 160, 5-Mnk*2];


module heatBedHolder160x160(pX=0, pY=0, pZ=0, rX=0, rY=0, rZ=0, dispMetall = true, clr="lightgrey"){
    translate([pX, pY, pZ])
    rotate([rX, rY, rZ])
    color(clr){
        minkowski(){
        difference(){
            translate([(-vHBHolder[1]/2),(-vHBHolder[2]/2), pZ])
                cube([vHBHolder[1], vHBHolder[2], vHBHolder[3]]);
           
            translate([0,0, pZ]){
                //cut internal parts        
                translate([(-vHBHolder[1]*0.75),(-vHBHolder[2]/4), -vHBHolder[3]/2])
                    cube([vHBHolder[1]/2, vHBHolder[2]/2, vHBHolder[3]*2]);            
                translate([(vHBHolder[1]*0.25),(-vHBHolder[2]/4), -vHBHolder[3]/2])
                    cube([vHBHolder[1]/2, vHBHolder[2]/2, vHBHolder[3]*2]);
                
                //holes for driving stripe
                translate([(-vHBHolder[1]*0.25+3*Mnk),-5, -vHBHolder[3]/2])
                    cube([3+Mnk*2, 10+Mnk, vHBHolder[3]*2]);
                translate([(vHBHolder[1]*0.25-3*2*Mnk),-5, -vHBHolder[3]/2])
                    cube([3+Mnk*2, 10+Mnk, vHBHolder[3]*2]);
            
                //holes for scrulls
                translate([(vHBHolder[1]/2 - sideDistX), (vHBHolder[2]/2 - sideDistY), (-vHBHolder[3]/2)])
                    cylinder(vHBHolder[3]*2, M_2, M_2, $fn=Fn*3);//M4
                translate([(vHBHolder[1]/2 - sideDistX), (-vHBHolder[2]/2 + sideDistY), (-vHBHolder[3]/2)])
                    cylinder(vHBHolder[3]*2, M_2, M_2, $fn=Fn*3);//M4
                translate([(-vHBHolder[1]/2 + sideDistX), (vHBHolder[2]/2 - sideDistY), (-vHBHolder[3]/2)])
                    cylinder(vHBHolder[3]*2, M_2, M_2, $fn=Fn*3);//M4
                translate([(-vHBHolder[1]/2 + sideDistX), (-vHBHolder[2]/2 + sideDistY), (-vHBHolder[3]/2)])
                    cylinder(vHBHolder[3]*2, M_2, M_2, $fn=Fn*3);//M4
            }//transform
        }//diff
        sphere(Mnk, $fn=Fn*4);
        }   
            
        LL8UUHolder(pY=(vHBHolder[2]/2-LL8UU[1]*3), pZ=LL8UU[1]*4.5+pZ, rX=180, dispMetall = false);
        LL8UUHolder(pX=-vHBHolder[1]/3, pY=(-vHBHolder[2]/2+LL8UU[1]*3), pZ=LL8UU[1]*4.5+pZ, rX=180, dispMetall = false);
        LL8UUHolder(pX=vHBHolder[1]/3, pY=(-vHBHolder[2]/2+LL8UU[1]*3), pZ=LL8UU[1]*4.5+pZ, rX=180, dispMetall = false);
    }//transform
    
}//module heatBedHolder160x160


//heatBedHolder160x160(pZ=5);
