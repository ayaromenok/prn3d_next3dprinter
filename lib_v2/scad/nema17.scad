Fn= 4;

module nema17(pX=0, pY=0, pZ=0, rX=0, rY=0, rZ=0, clr="grey")
{
    translate([pX, pY, pZ])
    rotate([rX, rY, rZ])
    color(clr)
    {
        difference(){
            translate([-42.2,-21.1,-21.1])
                cube([42.2,42.2,42.2]);
            //holes
            translate([1,15.5,15.5])
            rotate([0,-90,0])
                cylinder(6,1.5,1.5, $fn=1.5*Fn);
            translate([1,15.5,-15.5])
            rotate([0,-90,0])
                cylinder(6,1.5,1.5, $fn=1.5*Fn);
            translate([1,-15.5,15.5])
            rotate([0,-90,0])
                cylinder(6,1.5,1.5, $fn=1.5*Fn);
            translate([1,-15.5,-15.5])
            rotate([0,-90,0])
                cylinder(6,1.5,1.5, $fn=1.5*Fn);
            
            //granes
            translate([-43.2, 21.1, (-21.1-2*2.12)])
            rotate([45,0,0])
                cube([44.2,6,6]);
            translate([-43.2, 21.1, (21.1-2.12*2)])
            rotate([45,0,0])
                cube([44.2,6,6]);
            translate([-43.2, -21.1, (-21.1-2*2.12)])
            rotate([45,0,0])
                cube([44.2,6,6]);
            translate([-43.2, -21.1, (21.1-2.12*2)])
            rotate([45,0,0])
                cube([44.2,6,6]);
        }//difference
        rotate([0,90,0])
            cylinder(2,11,11, $fn=11*Fn);
        rotate([0,90,0])
            cylinder(20,2.5,2.5, $fn=2.5*Fn);
       
        
    }//body
}

module nema17Holder(pX=0, pY=0, pZ=0, rX=0, rY=0, rZ=0, clr="lightgrey")
{
    translate([pX, pY, pZ])
    rotate([rX, rY, rZ])
    color(clr)
    {
        difference(){
            translate([0,-21.3,-21.3])
                cube([3,42.6,42.6]);
            //holes
            translate([5,15.5,15.5])
            rotate([0,-90,0])
                cylinder(6,1.7,1.7, $fn=1.7*2*Fn);
            translate([5,15.5,-15.5])
            rotate([0,-90,0])
                cylinder(6,1.7,1.7, $fn=1.7*2*Fn);
            translate([5,-15.5,15.5])
            rotate([0,-90,0])
                cylinder(6,1.7,1.7, $fn=1.7*2*Fn);
            translate([5,-15.5,-15.5])
            rotate([0,-90,0])
                cylinder(6,1.7,1.7, $fn=1.7*2*Fn);
            translate([-1,0,0])
            rotate([0,90,0])
                cylinder(5,11.3,11.3, $fn=11*Fn);
        }//difference
        
        translate([-40,-21.3,-24.3])
                cube([43,42.6,3]);
    }//body
}
module nema17Holder2(pX=0, pY=0, pZ=0, rX=0, rY=0, rZ=0, clr="lightgrey")
{
    translate([pX, pY, pZ])
    rotate([rX, rY, rZ])
    color(clr)
    {
        difference(){
            translate([0,-21.3,-21.3])
                cube([3,42.6,42.6]);
            //holes
            translate([5,15.5,15.5])
            rotate([0,-90,0])
                cylinder(6,1.7,1.7, $fn=1.7*2*Fn);
            translate([5,15.5,-15.5])
            rotate([0,-90,0])
                cylinder(6,1.7,1.7, $fn=1.7*2*Fn);
            translate([5,-15.5,15.5])
            rotate([0,-90,0])
                cylinder(6,1.7,1.7, $fn=1.7*2*Fn);
            translate([5,-15.5,-15.5])
            rotate([0,-90,0])
                cylinder(6,1.7,1.7, $fn=1.7*2*Fn);
            translate([-1,0,0])
            rotate([0,90,0])
                cylinder(5,11.3,11.3, $fn=11*Fn);
            translate([-1,0,-11.3])
                cube([6,22.6,22.6]);
        }//difference
        
        translate([-43,-21.3,-24.3])
                cube([46,42.6,3]);
        translate([-43,-21.3,21.3])
                cube([46,42.6,3]);
        translate([-43,-24.3,-24.3])
                cube([46,3,48.6]);
        
    }//body
}
module nema17GT2Puley(pX=0, pY=0, pZ=0, rX=0, rY=0, rZ=0, clr="darkgrey")
{
    translate([pX, pY, pZ])
    rotate([rX, rY+90, rZ])
    color(clr)
    {
        difference(){
        union(){
        cylinder(7,8,8, $fn=8*Fn);
        translate([0,0,7])
            cylinder(8,6,6, $fn=6*Fn);
        translate([0,0,15])
            cylinder(1,8,8, $fn=8*Fn);
        }//union
        rotate([0,00,0])
            cylinder(20,2.7,2.7, $fn=2.7*Fn);
    }
    }//transform
}
module KFL08(pX=0, pY=0, pZ=0, rX=0, rY=0, rZ=0, clr="darkgrey")
{
    translate([pX, pY, pZ])
    rotate([rX, rY, rZ])
    color(clr)
    {
        difference(){
        union(){
            cylinder(8.5, 13.5, 13.5, $fn=14*Fn);
            cylinder(12, 6, 6,$fn=6*Fn);
            translate([18.5, 0, 0])
                cylinder(4, 5.5, 5.5, $fn=5*Fn);
            translate([-18.5, 0, 0])
                cylinder(4, 5.5, 5.5, $fn=5*Fn);
            translate([-18.5, -5.5, 0])
                cube([37, 11, 4]);
            }//union
            translate([0,0,-1])
                cylinder(15, 4, 4, $fn=4*Fn);
            translate([18.5, 0, -1])
                cylinder(6, 2.5, 2.5, $fn=3*Fn);
            translate([-18.5, 0, -1])
                cylinder(6, 2.5, 2.5, $fn=3*Fn);
        }//difference        
    }//trasform
}//module KLF08
//KFL08();
//nema17(pX=0, rX=0);
//nema17Holder2(pX=0, pY=0);
//nema17GT2Puley(pX=5);