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
        
        translate([-7,-21.3,-24.3])
                cube([10,42.6,3]);
    }//body
}
//nema17(pX=5, rX=0);
//nema17Holder(pX=5, pY=50);