// shafts: M8x350
include <../scad/globalParams.scad>

Fn = gFn;
bTestInPlace = gbTestInPlace;

module shaft_Mx(_posX=0, _posY=0, _posZ=0, _rotX=0, _rotY=0, _rotZ=0, _clr="grey", _M_2=M_2, _length = length) {
	translate([_posX, _posY, _posZ])
		rotate([_rotX, _rotY, _rotZ])
			color(_clr)
				cylinder(_length, _M_2, _M_2, $fn=_M_2*2*Fn);
}

module shaft_M8x350_x(pX=0, pY=0, pZ=0, clr="grey"){
	shaft_Mx(_posX=pX, _posY=pY, _posZ=pZ, _clr=clr, _rotY=90, _length=350);
}
module shaft_M8x350_y(pX=0, pY=0, pZ=0, clr="grey"){
	shaft_Mx(_posX=pX, _posY=pY, _posZ=pZ, _clr=clr, _rotX=-90, _length=350);
}
module shaft_M8x350_z(pX=0, pY=0, pZ=0, clr="grey"){
	shaft_Mx(_posX=pX, _posY=pY, _posZ=pZ, _clr=clr, _rotZ=90, _length=350);
}

if (bTestInPlace){
//	shaft_Mx();
	shaft_M8x350_x(pX=60);
	shaft_M8x350_y(pX=40);
	shaft_M8x350_z(pX=20);
}