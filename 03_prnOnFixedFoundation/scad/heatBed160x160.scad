sizeHB = 160;
sizeHole = 10;
rHole = 2.5;
FN = 2;
module heatBed160x160(pX=0, pY=0, pZ=0, rZ=0, clr="lightgrey"){
    translate([pX, pY, pZ])
        rotate([0,0, rZ])
            color(clr)
                difference(){
                    translate([-sizeHB/2, -sizeHB/2, 0])
                        cube([sizeHB, sizeHB, 3]);
                    translate([-sizeHB/2+5, -sizeHB/2+5, -1])    
                        cylinder (sizeHole, rHole, rHole, $fn=FN*2*rHole);        
                    translate([sizeHB/2-5, -sizeHB/2+5, -1])    
                        cylinder (sizeHole, rHole, rHole, $fn=FN*2*rHole);
                    translate([sizeHB/2-5, sizeHB/2-5, -1])    
                        cylinder (sizeHole, rHole, rHole, $fn=FN*2*rHole);
                    translate([-sizeHB/2+5, sizeHB/2-5, -1])    
                        cylinder (sizeHole, rHole, rHole, $fn=FN*2*rHole);    
                }
}