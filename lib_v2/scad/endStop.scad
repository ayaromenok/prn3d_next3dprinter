module endStop(pX=0, pY=0, pZ=0, rX=0, rY=0, rZ=0, clr="grey")
{
    translate([pX, pY, pZ])
    rotate([rX, rY, rZ])
    color(clr)
    {
        difference(){
            cube([40, 16, 2]);
            translate([17, 13, -1])
                cylinder(4, 1.7, 1.7, $fn=12);
            translate([36,13,-1])
                cylinder(4, 1.7, 1.7, $fn=12);
        }
        translate([0, 2, 2])
            cube([8,12,6]);
        translate([20, 10, 2])
            cube([12,6,6]);
        translate([33, 16, 3])
            cube([5,2,4]);
    
    }//transform
}//module endStop

module endStopHolder(pX=0, pY=0, pZ=0, rX=0, rY=0, rZ=0, clr="lightgrey", sizeY=16)
{
    translate([pX, pY, pZ])
    rotate([rX, rY, rZ])
    color(clr)
    {
         difference(){
            translate([10, 16-sizeY,0]) 
                cube([30, sizeY, 7]);
            translate([17, 13, -1])
                cylinder(12, 1, 1, $fn=12);
            translate([36,13,-1])
                cylinder(12, 1, 1, $fn=12);
        }
    }//transform
}//module
//endStop();
//endStopHolder();