//Muts
include <../../settings/scad/global.scad>

fnl = fn; //fn local

//Mx = [rInt, rExt, height]
// source: https://image.slidesharecdn.com/dimensionsofmetrichexnuts-121221090634-phpapp01/95/dimensions-of-metric-hex-nuts-1-638.jpg
M1_6 = [0.8,1.75,1.2];
M2 = [1,2.2,1.5];
M2_5 = [1.25,2.75,1.9];
M3 = [1.5, 3, 2.2];
M4 = [2, 3.85, 3];
M5 = [2.5, 4.4, 4.5];
M6 = [3, 5.55, 5];
M8 = [4, 7.2, 6.6];
M10 = [5,8.9,8.2];
M12 = [6,10.1,10.6];
M14 = [7,11.8,12.5];
M16 = [8,13.6,14.5];
M20 = [10,16.7,17.4];
M24 = [12,20.4,20.8];
//M = [,,];


module nut_Mx(rInt=4,rExt=7.2,height=6.44){
		difference(){
			cylinder(height,rExt,rExt, $fn=6);
			translate([0,0,-1])
			cylinder(height+2,rInt,rInt, $fn=4*2*fnl);
		}
}

// M1_6..M24
module nut_M1_6(){
	nut_Mx(M1_6[0], M1_6[1], M1_6[2]);
}
module nut_M2(){
	nut_Mx(M2[0], M2[1], M2[2]);
}
module nut_M2_5(){
	nut_Mx(M2_5[0], M2_5[1], M2_5[2]);
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
module nut_M10(){
	nut_Mx(M10[0], M10[1], M10[2]);
}
module nut_M12(){
	nut_Mx(M12[0], M12[1], M12[2]);
}
module nut_M14(){
	nut_Mx(M14[0], M14[1], M14[2]);
}
module nut_M16(){
	nut_Mx(M16[0], M16[1], M16[2]);
}
module nut_M18(){
	nut_Mx(M18[0], M18[1], M18[2]);
}
module nut_M20(){
	nut_Mx(M20[0], M20[1], M20[2]);
}
module nut_M24(){
	nut_Mx(M24[0], M24[1], M24[2]);
}


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