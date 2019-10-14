include <../../settings/scad/global.scad>

include <../../lib/scad/threadedBars.scad>
include <../../lib/scad/nuts.scad>

fnl = 2*fn; //fn local
correction=0;
M = 8-correction; //use M8 threaded bars
length=50;
lengthCorrected = length - 2*correction;
M_2 = M/2;

threadedBar_M8_x(posX=-10);
nut_M8_x(posX=-8);


module holderThrBar(posX=0, posY=0, posZ=0, rotX=0, rotY=0, rotZ=0, clr="red", Mx=8){
	translate([posX, posY, posZ])
		rotate([rotX, rotY, rotZ])
			color(clr)
				difference(){
					cylinder (length,Mx,Mx, $fn=Mx*fnl);
						translate([0,0,-1])
						cylinder (length+2,Mx/2+0.2,Mx/2+0.2, $fn=Mx/2*fnl);
				}//diff
} //holderThrBar


holderThrBar(rotY=90, clr=([0.6,1,0.6]));
holderThrBar(posY=length-M*2, rotY=90, clr=([0.7,1,0.7]));
holderThrBar(posY=(length-M*2)/2, posZ=M*4, rotY=90,clr=([0.8,1,0.8]));

holderThrBar(posX=length/2, posY=-M, posZ=M*6, rotY=90, rotZ=90, clr=([0.5,1,0.5]));
holderThrBar(posX=M, posY=-M, posZ=M*2, rotY=90, rotZ=90, clr=([0.4,1,0.4]));
holderThrBar(posX=length-M, posY=-M, posZ=M*2, rotY=90, rotZ=90, clr=([0.3,1,0.3]));

translate([0,-M,-M])
	difference(){
		minkowski(){
			cube([lengthCorrected,lengthCorrected,lengthCorrected]);
			sphere(M/2, $fn = 4*4*fnl);
		}//minkowski
		translate([0,0,-M_2])
			cube([lengthCorrected,lengthCorrected,lengthCorrected+M]);
		translate([0,-M_2,0])
			cube([lengthCorrected,lengthCorrected+M,lengthCorrected]);
		translate([-M_2,0,0])
			cube([lengthCorrected+M,lengthCorrected,lengthCorrected]);
}


