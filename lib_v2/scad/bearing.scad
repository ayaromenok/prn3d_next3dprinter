//bearing608rs();
//bearing608rsHolder(pX=0);

module bearing608rs (pX=0, pY=0, pZ=0, rX=0, rY=0, rZ=0, clr="grey")
{
    translate([pX, pY, pZ-3.5])
    rotate([rX, rY, rZ])
    color(clr)
    {
        difference(){
            cylinder(7,11,11,$fn=7*4);
            translate([0,0,-1])
                cylinder(9,4,4,$fn=4*4);
        }//dif
    }//transform
}//module bearing608rs

module bearing608rsHolder (pX=0, pY=0, pZ=0, rX=0, rY=0, rZ=0, clr="grey")
{
    translate([pX, pY, pZ])
    rotate([rX, rY, rZ])
    color(clr)
    {
        difference(){
            union(){                
                translate([-24,-8,-8.5])
                    cube([4,16,17]);
                
                translate([-20,-8,-8.5])
                    cube([20,16,3]);
                translate([0,0,-5.5])
                    cylinder(2,12,6,$fn=10*4);
                translate([0,0,-8.5])
                    cylinder(3,14,14,$fn=10*4);
        
                translate([-20,-8,5.5])
                    cube([20,16,3]);
                translate([0,0,3.5])
                    cylinder(2,6,12,$fn=10*4);
                translate([0,0,5.5])
                    cylinder(3,14,14,$fn=10*4);                
                }//union
            translate([0,0,-10])
                cylinder(20, 4.4, 4.4, $fn=4*4);
        }//dif
    }//transform
}//module bearing608rs
