include <../../settings/scad/global.scad>
include <../../lib/scad/shafts.scad>
include <../../prn_200x200x200/scad/connector_m8.scad>
include <../../prn_200x200x200/scad/basement.scad>

//basement();


shaftY_0=[shaftY_posX+Mx,-lnConnect/2,(Mx-correction)*2];
shaftY_1=[shaftY_posX+lnConnect*2-Mx,-lnConnect/2,(Mx-correction)*2];

module chassis_axisY() {
	connector_M8_shaftY(posX=shaftY_posX, posY=-lnConnect+Mx);
	connector_M8_shaftY(posX=shaftY_posX, posY=lnBase+Mx);

	// --- Y shafts
	shaft_8x350_y(shaftY_0[0],shaftY_0[1],shaftY_0[2]);
	LLMK8UU_yp(shaftY_0[0],shaftY_0[1]+100,shaftY_0[2]);
	LLMK8UU_yn(shaftY_0[0],shaftY_0[1]+200,shaftY_0[2]);

	shaft_8x350_y(shaftY_1[0],shaftY_1[1],shaftY_1[2]);
	LLMK8UU_yp(shaftY_1[0],shaftY_1[1]+100,shaftY_1[2]);
	LLMK8UU_yn(shaftY_1[0],shaftY_1[1]+200,shaftY_1[2]);
}//axisY
