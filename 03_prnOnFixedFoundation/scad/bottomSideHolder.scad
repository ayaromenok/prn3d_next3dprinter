
botSideHolder();

bshLength = 50;
Mx = 8;

angleX = 0;
angleY = 45;
sizeXY = 50;
sizeTnk = 3;


module botSideHolder( pX=0, pY=0, pZ=0, rX=0, rY=0, rZ=0, clr="grey")
{
    translate([pX, pY, pZ])
    rotate([rX, rY, rZ])
    color(clr){
        translate([Mx, Mx, sizeTnk*4])
        rotate([angleX, angleY, 0])

        {        
            difference(){
                cylinder(bshLength, Mx, Mx, $fn=Mx*4);
                translate([0,0,-1])
                    cylinder(bshLength+2, Mx/2+0.4, Mx/2+0.4, $fn=Mx*2);
            }//dif
        }//transform
        
        difference(){
        cube([sizeXY, sizeXY, sizeTnk]);
        translate([sizeXY-5, sizeXY-5, -1])
            cylinder(sizeTnk+2, 2, 2, $fn=8);
        translate([sizeXY/2, sizeXY/2, -1])
            cylinder(sizeTnk+2, 2, 2, $fn=8);
        }
        translate([0,0,-sizeTnk*3])
            cube([sizeXY, sizeTnk, sizeTnk*3]);
        
        translate([0,0,-sizeTnk*3])
            cube([sizeTnk, sizeXY, sizeTnk*3]); 
        
        //support
        translate([15, Mx, 0])
            cylinder(15, Mx/2, Mx/2, $fn=3);
        translate([30, Mx, 0])
            cylinder(30, Mx/2, Mx/2, $fn=3);
        translate([45, Mx, 0])
            cylinder(45, Mx/2, Mx/2, $fn=3);
    }//transform
}//module


