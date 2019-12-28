// linear bearings 
// LLxUU: LL8UU, LL6UU
// LMKxUU: LMK8UU, LMK6UU, LMK8SUU

include <../scad/linearBearing_H.scad>

Fn = gFn;
bTestInPlace = gbTestInPlace;

module LLxUU(_posX=0, _posY=0, _posZ=0, _rotX=0, _rotY=0, _rotZ=0, _clr="grey", _type=LL8UU){
	translate([_posX, _posY, _posZ])
		rotate([_rotX, _rotY, _rotZ])
			color(_clr)
				difference(){
					union(){
						cylinder(_type[2], _type[4], _type[4], $fn=_type[2]*2*Fn);
						cylinder(((_type[2]-_type[5]*2-_type[6])/2), _type[3], _type[3], $fn=_type[3]*2*Fn);
						translate([0,0,((_type[2]-_type[5]*2-_type[6])/2+_type[5])])
							cylinder((_type[6]), _type[3], _type[3], $fn=_type[3]*2*Fn);
						translate([0,0,((_type[2]-_type[5]*2-_type[6])/2+_type[5]*2+_type[6])])
							cylinder(((_type[2]-_type[5]*2-_type[6])/2), _type[3], _type[3], $fn=_type[3]*2*Fn);
					} //union
					translate([0,0,-1])
						cylinder(_type[2]+2, _type[1], _type[1], $fn=_type[1]*2*Fn);
				} //difference
	if (gEcho){
		if (gEchoFull){
			echo (_type[0], "pos:",_posX, _posY, _posZ, "rot:", _rotX, _rotY, _rotZ, "clr:", _clr);
		} else {
			echo(_type[0]);
		}
	} 
} //module LLxUU

//LL8UU_
module LL8UU_x(pX=0, pY=0, pZ=0, clr="grey"){
		LLxUU(_posX=pX-LL8UU[2]/2, _posY=pY, _posZ=pZ, _rotY=90, _clr=clr);
}
module LL8UU_y(pX=0, pY=0, pZ=0, clr="grey"){
		LLxUU(_posX=pX, _posY=pY-LL8UU[2]/2, _posZ=pZ, _rotX=-90, _clr=clr);
}
module LL8UU_z(pX=0, pY=0, pZ=0, clr="grey"){
		LLxUU(_posX=pX, _posY=pY, _posZ=pZ-LL8UU[2]/2, _rotZ=90, _clr=clr);
}

//LL6UU_
module LL6UU_x(pX=0, pY=0, pZ=0, clr="grey"){
		LLxUU(_posX=pX-LL6UU[2]/2, _posY=pY, _posZ=pZ, _rotY=90, _clr=clr, _type=LL6UU);
}
module LL6UU_y(pX=0, pY=0, pZ=0, clr="grey"){
		LLxUU(_posX=pX, _posY=pY-LL6UU[2]/2, _posZ=pZ, _rotX=-90, _clr=clr, _type=LL6UU);
}
module LL6UU_z(pX=0, pY=0, pZ=0, clr="grey"){
		LLxUU(_posX=pX, _posY=pY, _posZ=pZ-LL6UU[2]/2, _rotZ=90, _clr=clr, _type=LL6UU);
}

module LMKxUU(_posX=0, _posY=0, _posZ=0, _rotX=0, _rotY=0, _rotZ=0, _clr="grey", _type=LMK8UU){
	translate([_posX, _posY, _posZ])
		rotate([_rotX, _rotY, _rotZ])
			color(_clr)
	difference(){	
		union(){
			cylinder(_type[2],_type[3],_type[3], $fn=_type[3]*2*Fn);
			rotate([0,0,45])
				cylinder(_type[5],_type[4],_type[4], $fn=4);
		}//union
		translate([0,0,-1])	
		cylinder(_type[2]+2,_type[1],_type[1], $fn=_type[1]*2*Fn);
		for(angle = [45:90:350]){
			translate([(_type[9]*sin(angle)), (_type[9]*cos(angle)), -1])
				cylinder(_type[5]+2, _type[6], _type[6], $fn=_type[6]*2*Fn);
			translate([(_type[9]*sin(angle)), (_type[9]*cos(angle)), -1])
				cylinder(_type[8]+1, _type[7], _type[7], $fn=_type[7]*2*Fn);
		} //for
	} //difference
	if (gEcho){
		if (gEchoFull){
			echo (_type[0], "pos:",_posX, _posY, _posZ, "rot:", _rotX, _rotY, _rotZ, "clr:", _clr);
		} else {
			echo(_type[0]);
		}
	} 
} //module LMKxUU

//LL8UU_
module LMK8UU_x(pX=0, pY=0, pZ=0, clr="grey"){
		LMKxUU(_posX=pX-LMK8UU[2]/2, _posY=pY, _posZ=pZ, _rotY=90, _clr=clr);
}
module LMK8UU_y(pX=0, pY=0, pZ=0, clr="grey"){
		LMKxUU(_posX=pX, _posY=pY-LMK8UU[2]/2, _posZ=pZ, _rotX=-90, _clr=clr);
}
module LMK8UU_z(pX=0, pY=0, pZ=0, clr="grey"){
		LMKxUU(_posX=pX, _posY=pY, _posZ=pZ-LMK8UU[2]/2, _rotZ=90, _clr=clr);
}	

//LL8SUU_
module LMK8SUU_x(pX=0, pY=0, pZ=0, clr="grey"){
		LMKxUU(_posX=pX-LMK8SUU[2]/2, _posY=pY, _posZ=pZ, _rotY=90, _clr=clr, _type=LMK8SUU);
}
module LMK8SUU_y(pX=0, pY=0, pZ=0, clr="grey"){
		LMKxUU(_posX=pX, _posY=pY-LMK8SUU[2]/2, _posZ=pZ, _rotX=-90, _clr=clr, _type=LMK8SUU);
}
module LMK8SUU_z(pX=0, pY=0, pZ=0, clr="grey"){
		LMKxUU(_posX=pX, _posY=pY, _posZ=pZ-LMK8SUU[2]/2, _rotZ=90, _clr=clr, _type=LMK8SUU);
}

//LL6UU_
module LMK6UU_x(pX=0, pY=0, pZ=0, clr="grey"){
		LMKxUU(_posX=pX-LMK6UU[2]/2, _posY=pY, _posZ=pZ, _rotY=90, _clr=clr, _type=LMK6UU);
}
module LMK6UU_y(pX=0, pY=0, pZ=0, clr="grey"){
		LMKxUU(_posX=pX, _posY=pY-LMK6UU[2]/2, _posZ=pZ, _rotX=-90, _clr=clr, _type=LMK6UU);
}
module LMK6UU_z(pX=0, pY=0, pZ=0, clr="grey"){
		LMKxUU(_posX=pX, _posY=pY, _posZ=pZ-LMK6UU[2]/2, _rotZ=90, _clr=clr, _type=LMK6UU);
}	

//tests
if (bTestInPlace){
	//LLxUU();
    
	LL8UU_x(pX=60);
	LL8UU_y(pX=40);
	LL8UU_z(pX=20);
	LL6UU_x(pX=60, pY=40);
	LL6UU_y(pX=40, pY=40);
	LL6UU_z(pX=20, pY=40);
	
	//LMKxUU();
	LMK8UU_x(pX=-120);
	LMK8UU_y(pX=-80);
	LMK8UU_z(pX=-40);
	LMK8SUU_x(pX=-120, pY=40);
	LMK8SUU_y(pX=-80, pY=40);
	LMK8SUU_z(pX=-40, pY=40);
	LMK6UU_x(pX=-120, pY=80);
	LMK6UU_y(pX=-80, pY=80);
	LMK6UU_z(pX=-40, pY=80);
}