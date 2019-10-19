include <../../settings/scad/global.scad>

include <../../lib/scad/threadedBars.scad>
include <../../lib/scad/nuts.scad>

fnl = 4*fn; //fn local

length=lnConnect;
lengthCorrected = length - 2*correction;


//threadedBar_M8_x(posXi=-10);
//nut_M8_x(posXi=-8);


module holderThrBar(posXi=0, posYi=0, posZi=0, rotXi=0, rotYi=0, rotZi=0, clri="red", Mxl=8){
	translate([posXi, posYi, posZi])
		rotate([rotXi, rotYi, rotZi])
			color(clri)
				difference(){
					cylinder (length,Mxl,Mxl, $fn=Mxl*fnl);
						translate([0,0,-1])
						cylinder (length+2,Mxl/2+0.2,Mxl/2+0.2, $fn=Mxl/2*fnl);
				}//diff
} //holderThrBar

module holderThrBarX2(posXi=0, posYi=0, posZi=0, rotXi=0, rotYi=0, rotZi=0, clri="red", Mxl=8){
	translate([posXi, posYi, posZi])
		rotate([rotXi, rotYi, rotZi])
			color(clri)
				difference(){
					cylinder (length*2,Mxl,Mxl, $fn=Mxl*fnl);
						translate([0,0,-1])
						cylinder (length*2+2,Mxl/2+0.2,Mxl/2+0.2, $fn=Mxl/2*fnl);
				}//diff
} //holderThrBar

module holderShaftBar(posXi=0, posYi=0, posZi=0, rotXi=0, rotYi=0, rotZi=0, clri="green", Mxl=8){
	translate([posXi, posYi, posZi])
		rotate([rotXi, rotYi, rotZi])
			color(clri)
				difference(){
					cylinder (length,Mxl,Mxl, $fn=Mxl*fnl);
						translate([0,0,length/2-1])
						cylinder (length/2+2,Mxl/2+0.2,Mxl/2+0.2, $fn=Mxl/2*fnl);
				}//diff
} //holderShaftBar

module slicerShaftBar(posXi=0, posYi=0, posZi=0, rotXi=0, rotYi=0, rotZi=0, clri="green", Mxl=8){
	translate([posXi, posYi, posZi])
		rotate([rotXi, rotYi, rotZi])
			color(clri)
				difference(){
					cylinder (length,Mxl,Mxl, $fn=Mxl*fnl);
						translate([0,0,-1])
						cylinder (length+2,Mxl/2+0.2,Mxl/2+0.2, $fn=Mxl/2*fnl);
						//! todo: add LMK8UU or LM8UU holders
				}//diff
} //slicerShaftBar

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


module connector_M8_shaftY(posX=0, posY=0, posZ=0, rotX=0, rotY=0, rotZ=0, clr="green"){
	translate([posX, posY, posZ])
		rotate([rotX, rotY, rotZ])
			color(clr){
				holderThrBarX2(rotYi=90, clri=clr);
				holderThrBarX2(posYi=length-M*2-correction*2, rotYi=90, clri=clr);
				holderThrBarX2(posYi=(length-M*2-correction*2)/2, posZi=M*4, rotYi=90, clri=clr);

				
				holderShaftBar(posXi=M+correction, posYi=-M-correction, posZi=M*2, rotYi=90, rotZi=90, clri=clr);
				holderShaftBar(posXi=length*2-M-correction, posYi=-M-correction, posZi=M*2, rotYi=90, rotZi=90, clri=clr);
			}//transform
}//connector_M8_shaftY

module connector_M8_shaftZ(posX=0, posY=0, posZ=0, rotX=0, rotY=0, rotZ=0, clr="green"){
	translate([posX, posY, posZ])
		rotate([rotX, rotY, rotZ])
			color(clr){
				holderThrBarX2(rotYi=90, clri=clr);
				holderThrBarX2(posYi=length-M*2-correction*2, rotYi=90, clri=clr);
				holderThrBarX2(posYi=(length-M*2-correction*2)/2, posZi=M*4, rotYi=90, clri=clr);

				
				holderShaftBar(posXi=M+correction, posYi=Mx_2-correction, posZi=Mx_2+correction, clri=clr);
				holderShaftBar(posXi=length*2-M-correction, posYi=Mx_2-correction, posZi=Mx_2+correction, clri=clr);
			}//transform
}//connector_M8_shaftZ


module connector_M8_shaftX(posX=0, posY=0, posZ=0, rotX=0, rotY=0, rotZ=0, clr="green"){
	translate([posX, posY, posZ])
		rotate([rotX, rotY, rotZ])
			color(clr){
				holderShaftBar(posXi=M*3, posYi=-Mx_2, posZi=Mx_2+correction, rotXi=-90, clri=clr);
				holderShaftBar(posXi=M*3, posYi=-Mx_2, posZi=length+Mx_2+correction,  rotXi=-90, clri=clr);
				
				slicerShaftBar(posXi=M+correction, posYi=Mx_2-correction, posZi=Mx_2+correction, clri=clr);
				slicerShaftBar(posXi=length*2-M-correction, posYi=Mx_2-correction, posZi=Mx_2+correction, clri=clr);
			}//transform
}//connector_M8_shaftX

//connector_M8_shaftX();
//holderShaftBar();

//support
/*
translate([0,Mx_2+0.2,-Mx])
	cube([length,length-Mx*3-0.2*2,Mx*2]);

translate([M,-Mx,M])
	cube([length-Mx*3-0.2*2,length,Mx*2]);
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
