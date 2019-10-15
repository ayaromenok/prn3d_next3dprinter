include <../../settings/scad/global.scad>
include <../../lib/scad/shafts.scad>
include <../../prn_200x200x200/scad/connector_m8.scad>
include <../../prn_200x200x200/scad/basement.scad>

//basement();

shaftY_0=[shaftY_posX+Mx,-lnConnect/2,(Mx-correction)*2];
shaftY_1=[shaftY_posX+lnConnect*2-Mx,-lnConnect/2,(Mx-correction)*2];

shaftZ_left0=[-lnConnect+M+Mx_2, shaftZ_posY+Mx, lnConnect/2+Mx_2+correction];
shaftZ_left1=[-lnConnect+M+Mx_2, shaftZ_posY+lnConnect*2-Mx, lnConnect/2+Mx_2+correction];
shaftZ_right0=[lnBase+lnConnect-M-Mx_2, shaftZ_posY+Mx, lnConnect/2+Mx_2+correction];
shaftZ_right1=[lnBase+lnConnect-M-Mx_2, shaftZ_posY+lnConnect*2-Mx, lnConnect/2+Mx_2+correction];


module chassis_axisZ() {
	connector_M8_shaftZ(posX=lnBase+lnConnect-Mx, posY=shaftZ_posY, posZ=Mx+M, rotZ=90);
	connector_M8_shaftZ(posX=-lnConnect+Mx, posY=shaftZ_posY+lnConnect*2, posZ=Mx+M, rotZ=-90);

	shaft_8x350_z(shaftZ_left0[0],shaftZ_left0[1],shaftZ_left0[2]);
	LLMK8UU_zp(shaftZ_left0[0],shaftZ_left0[1],shaftZ_left0[2]+75);
	LLMK8UU_zn(shaftZ_left0[0],shaftZ_left0[1],shaftZ_left0[2]+175);

	shaft_8x350_z(shaftZ_left1[0],shaftZ_left1[1],shaftZ_left1[2]);
	LLMK8UU_zp(shaftZ_left1[0],shaftZ_left1[1],shaftZ_left1[2]+75);
	LLMK8UU_zn(shaftZ_left1[0],shaftZ_left1[1],shaftZ_left1[2]+175);

	// --- Z right shafts
	shaft_8x350_z(shaftZ_right0[0],shaftZ_right0[1],shaftZ_right0[2]);
	LLMK8UU_zp(shaftZ_right0[0],shaftZ_right0[1],shaftZ_right0[2]+75);
	LLMK8UU_zn(shaftZ_right0[0],shaftZ_right0[1],shaftZ_right0[2]+175);

	shaft_8x350_z(shaftZ_right1[0],shaftZ_right1[1],shaftZ_right1[2]);
	LLMK8UU_zp(shaftZ_right1[0],shaftZ_right1[1],shaftZ_right1[2]+75);
	LLMK8UU_zn(shaftZ_right1[0],shaftZ_right1[1],shaftZ_right1[2]+175);
}//axisY
chassis_axisZ();
// --- Z left shafts
