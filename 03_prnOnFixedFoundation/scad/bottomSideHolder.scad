
botSideHolder();

bshLength = 50;
Mx = 8;

angle = (90-65.9);
height = 16;
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

module botSideHolder( pX=0, pY=0, pZ=0, rX=0, rY=0, rZ=0, clr="grey")
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
        
        difference(){
            translate([-28, 0, 0])
                cube([length, 10, 3]);
            holeM3(15-28, 5);
            holeM3(length-10-28, 5);
        }//dif
        
        difference(){
            translate([-28, 10, 0])
                cube([length, 3, length]);
                holeM3(10,13, 25, 90);
                holeM3(-20,13, 50, 90);
        }//diff
        difference(){    
            translate([29, 0, 0])
                cube([3, 10, length]);
            holeM3(32, 5, 15, 0, -90);
            holeM3(32, 5, length-10, 0, -90);       
        }//diff
    }//transform
}//module


