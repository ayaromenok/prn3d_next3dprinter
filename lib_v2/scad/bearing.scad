module bearing608rs (pX=0, pY=0, pZ=0, rX=0, rY=0, rZ=0, clr="grey")
{
    translate([pX, pY, pZ])
    rotate([rX, rY, rZ])
    color(clr)
    {
        difference(){
            cylinder(7,11,11,$fn=7*4);
            translate([0,0,-1])
            cylinder(9,4,4,$fn=4*4);
        }//dif
    }//transform
}//module bearing
bearing608rs();