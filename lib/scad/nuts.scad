//Muts
include <../../settings/scad/global.scad>

fnl = fn; //fn local

//Mx = [rInt, rExt, height]
M3 = [1.5, 3, 2.2];
M4 = [2, 3.85, 3];
M5 = [2.5, 4.4, 4.5];
M6 = [3, 5.55, 5];
M8 = [4, 7.2, 6.44];
//M = [,,];


module nut_Mx(rInt=4,rExt=7.2,height=6.44){
		difference(){
			cylinder(height,rExt,rExt, $fn=6);
			translate([0,0,-1])
			cylinder(height+2,rInt,rInt, $fn=4*2*fnl);
		}
}

module nut_M3(){
	nut_Mx(M3[0], M3[1], M3[2]);
}
module nut_M4(){
	nut_Mx(M4[0], M4[1], M4[2]);
}
module nut_M5(){
	nut_Mx(M5[0], M5[1], M5[2]);
}
module nut_M6(){
	nut_Mx(M6[0], M6[1], M6[2]);
}
module nut_M8(){
	nut_Mx(M8[0], M8[1], M8[2]);
}

nut_M6();

module nut_M8_x(posX=0,posY=0,posZ=0){
	translate([posX,posY,posZ])
		rotate([0,90,0])
			color("grey")
				nut_M8();
}

module nut_M8_y(posX=0,posY=0,posZ=0){
	translate([posX,posY,posZ])
		rotate([-90,0,0])
			color("lightgrey")
				nut_M8();
}
module nut_M8_z(posX=0,posY=0,posZ=0){
	translate([posX,posY,posZ])
		rotate([0,0,90])
			color("darkgrey")
				nut_M8();
}