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
        }//difference
        rotate([0,90,0])
            cylinder(2,11,11, $fn=11*Fn);
        rotate([0,90,0])
            cylinder(20,2.5,2.5, $fn=2.5*Fn);
    }//body
}

//nema17(pX=5, rX=30);