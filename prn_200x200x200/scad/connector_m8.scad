include <../../settings/scad/global.scad>

include <../../lib/scad/threadedBars.scad>
include <../../lib/scad/nuts.scad>

fnl = 4*fn; //fn local
correction=1;
MX = 8;

M = MX-correction; //use M8 threaded bars
length=50;
lengthCorrected = length - 2*correction;
M_2 = M/2;
MX_2 = MX/2;

//threadedBar_M8_x(posXi=-10);
//nut_M8_x(posXi=-8);


module holderThrBar(posXi=0, posYi=0, posZi=0, rotXi=0, rotYi=0, rotZi=0, clri="red", Mx=8){
	translate([posXi, posYi, posZi])
		rotate([rotXi, rotYi, rotZi])
			color(clri)
				difference(){
					cylinder (length,Mx,Mx, $fn=Mx*fnl);
						translate([0,0,-1])
						cylinder (length+2,Mx/2+0.2,Mx/2+0.2, $fn=Mx/2*fnl);
				}//diff
} //holderThrBar

module connector_M8(posX=0, posY=0, posZ=0, rotX=0, rotY=0, rotZ=0, clr="red"){
	translate([posX, posY, posZ])
		rotate([rotX, rotY, rotZ])
			color(clr){
				holderThrBar(rotYi=90, clri=clr);
				holderThrBar(posYi=length-M*2-correction*2, rotYi=90, clri=clr);
				holderThrBar(posYi=(length-M*2-correction*2)/2, posZi=M*4, rotYi=90, clri=clr);

				holderThrBar(posXi=length/2, posYi=-M-correction, posZi=M*6, rotYi=90, rotZi=90, clri=clr);
				holderThrBar(posXi=M+correction, posYi=-M-correction, posZi=M*2, rotYi=90, rotZi=90, clri=clr);
				holderThrBar(posXi=length-M-correction, posYi=-M-correction, posZi=M*2, rotYi=90, rotZi=90, clri=clr);
			}//transform
}//connector

//support
/*
translate([0,MX_2+0.2,-MX])
	cube([length,length-MX*3-0.2*2,MX*2]);

translate([M,-MX,M])
	cube([length-MX*3-0.2*2,length,MX*2]);
*/
/*
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
*/
