include <../../lib_v2/scad/nema17.scad>
//botSideHolder(_showMetall=true);
topSideHolder(_showMetall=false); //add more longer middle part

bshLength = 50;
Mx = 8;

angle = (90-65.9);
height = 16;
height2 = 40;
length = 60;

module holeM3(_pX=0, _pY=0, _pZ=0, _rX=0, _rY=0, _rZ=0){
    translate([_pX, _pY, _pZ])
    rotate([_rX, _rY, _rZ]){
        union(){
            cylinder(100, 1.7, 1.7, $fn=12);
            translate([0,0, -0.1])
            cylinder(1.6, 3, 1.7, $fn=12);
        }//union
    }//transform
}//module holeM3

module topSideHolder( pX=0, pY=0, pZ=0, rX=0, rY=0, rZ=0, clr="grey", _showMetall = false)
{
    translate([pX, pY, pZ])
    rotate([rX, rY, rZ])
    color(clr){
        difference(){
            linear_extrude(height2)
                import("../dxf/topSideHolder.dxf", $fn=20);
            translate([45, 50, height/2])
            rotate([90, 0, angle])
                cylinder(70, Mx/2+0.4, Mx/2+0.4, $fn=Mx*4);
            translate([-45, 50, height/2])
            rotate([90, 0, -angle])
                cylinder(70, Mx/2+0.4, Mx/2+0.4, $fn=Mx*4);
            translate([18.5, 50, 26])
            rotate([90, 0, 0])
                cylinder(70, 2.4, 2.4, $fn=3*4);
            translate([-18.5, 50, 26])
            rotate([90, 0, 0])
                cylinder(70, 2.4, 2.4, $fn=3*4);
            translate([-35,25,15])
                cube([70,30,30]);
        }//diff
        
        barHolderM8V2(pY=20, pZ=6,rX=90); 
        
        if (_showMetall){
            KFL08(pY = 20, pZ=26, rX=90, rY=0);
            translate([40, 35, -height/2])
               cylinder(500, Mx/2+0.4, Mx/2+0.4, $fn=30);
            translate([-40, 35, -height/2])            
                cylinder(500, Mx/2+0.4, Mx/2+0.4, $fn=Mx*4);
         }//showMetal
    }//transform
}//module topSideHolder

hiftHolderMotorZZ = 0;
R=4;
Fn=4;
HR=10;
module barHolderM8V2(pX=0, pY=0, pZ=0, rX=0, rY=0, rZ=0, clr="grey", _showMetall = false)
{
    translate([pX, pY, pZ])
    rotate([rX, rY, rZ])
    color(clr)
    {
        difference(){
            union(){
                cylinder(HR,1.5*R, 1.5*R, $fn=R*2*2*Fn);
                //cylinder(HR/4, 2.3*R, 1.5*R, $fn=R*2*2*Fn);
                //translate([0,0,-shiftHolderMotorZ])
                //    cylinder(shiftHolderMotorZ, 2.*R, 2.*R, $fn=R*2*2*Fn);
            }//union
            cylinder(HR+1,R+0.3, R+0.5, $fn=R*2*Fn);
        }//diff
        translate([0,0,-10])
        cylinder(10,1.5*R, 1.5*R, $fn=R*2*2*Fn);
        //bar
        if (_showMetall){
            translate([0,0,0])
                cylinder(300,4,4, $fn=5);
        }
    }//transform    
} //barHolder

module botSideHolder( pX=0, pY=0, pZ=0, rX=0, rY=0, rZ=0, clr="grey", _showMetall = false)
{
    translate([pX, pY, pZ])
    rotate([rX, rY, rZ])
    color(clr){
        difference(){
            linear_extrude(height)
                import("../dxf/bottomSideHolder.dxf");
            translate([7,70,height/2])
            rotate([90,0,angle])
                cylinder(50, Mx/2+0.4, Mx/2+0.4, $fn=Mx*4);
        }//diff
        if (_showMetall){
            translate([7,70,height/2])
            rotate([90,0,angle])
            translate([0,0,-445])
                cylinder(500, Mx/2+0.4, Mx/2+0.4, $fn=Mx*4);
         }//showMetall
        difference(){
            translate([-28, -4, 0])
                cube([length, 14, 3]);
            holeM3(15-28, 1);
            holeM3(length-10-28, 1);
        }//dif
        
        difference(){
            translate([-28, 10, 0])
                cube([length, 3, length]);
                holeM3(10,13, 25, 90);
                holeM3(-20,13, 50, 90);
                holeM3(-5,13, 50, 90);
                holeM3(-20,13, 35, 90);
        }//diff
        difference(){    
            translate([29, -4, 0])
                cube([3, 14, length]);
            holeM3(32, 1, 15, 0, -90);
            holeM3(32, 1, length-10, 0, -90);       
        }//diff
        
        //supports
        translate([3, 13, height])
        rotate([0,-90,0])
        linear_extrude(3)
            polygon(points=[[0,0],[length/2,0],[0,length/2]]);
        
        translate([2, 13, 3])
        rotate([0,-180,0])
        linear_extrude(3)
            polygon(points=[[0,0],[length/2,0],[0,length/2]]);
    }//transform
}//module botSideHolder


