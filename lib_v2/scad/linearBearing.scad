include <../scad/globalParams.scad>

Fn = 4;//gFn;
bTestInPlace = gbTestInPlace;

// [0]M/2, [1]Length, [2]Diameter/2, [3]slotDiameter/2, [4]slotWidth, [5]slotDistance
LL6UU = [3, 19, (12/2), (11.5/2), 1.1, 11.3];
LL8UU = [4, 24, (15/2), (14.3/2), 1.1, 15.3];

module LLxUU(_posX=0, _posY=0, _posZ=0, _rotX=0, _rotY=0, _rotZ=0, _clr="grey", _type=LL8UU){
	translate([_posX, _posY, _posZ])
		rotate([_rotX, _rotY, _rotZ])
			color(_clr)
				difference(){
					union(){
						cylinder(_type[1], _type[3], _type[3], $fn=_type[2]*2*Fn);
						cylinder(((_type[1]-_type[4]*2-_type[5])/2), _type[2], _type[2], $fn=_type[2]*2*Fn);
						translate([0,0,((_type[1]-_type[4]*2-_type[5])/2+_type[4])])
							cylinder((_type[5]), _type[2], _type[2], $fn=_type[2]*2*Fn);
						translate([0,0,((_type[1]-_type[4]*2-_type[5])/2+_type[4]*2+_type[5])])
							cylinder(((_type[1]-_type[4]*2-_type[5])/2), _type[2], _type[2], $fn=_type[2]*2*Fn);
					}//union
					translate([0,0,-1])
						cylinder(_type[1]+2, _type[0], _type[0], $fn=_type[0]*2*Fn);
				}//difference
} //module LLxUU

//LL8UU_
module LL8UU_x(pX=0, pY=0, pZ=0, clr="grey"){
		LLxUU(_posX=pX, _posY=pY, _posZ=pZ, _rotY=90, _clr=clr);
}
module LL8UU_y(pX=0, pY=0, pZ=0, clr="grey"){
		LLxUU(_posX=pX, _posY=pY, _posZ=pZ, _rotX=-90, _clr=clr);
}
module LL8UU_z(pX=0, pY=0, pZ=0, clr="grey"){
		LLxUU(_posX=pX, _posY=pY, _posZ=pZ, _rotZ=90, _clr=clr);
}

//LL6UU_
module LL6UU_x(pX=0, pY=0, pZ=0, clr="grey"){
		LLxUU(_posX=pX, _posY=pY, _posZ=pZ, _rotY=90, _clr=clr, _type=LL6UU);
}
module LL6UU_y(pX=0, pY=0, pZ=0, clr="grey"){
		LLxUU(_posX=pX, _posY=pY, _posZ=pZ, _rotX=-90, _clr=clr, _type=LL6UU);
}
module LL6UU_z(pX=0, pY=0, pZ=0, clr="grey"){
		LLxUU(_posX=pX, _posY=pY, _posZ=pZ, _rotZ=90, _clr=clr, _type=LL6UU);
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
}