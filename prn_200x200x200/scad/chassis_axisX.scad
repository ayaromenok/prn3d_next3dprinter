include <../../settings/scad/global.scad>
include <../../lib/scad/shafts.scad>
include <../../prn_200x200x200/scad/connector_m8.scad>
include <../../prn_200x200x200/scad/basement.scad>

//basement();


shaftX_0=[-length/2, shaftZ_posY+M*3, shaftX_posZ+M*3-correction];
shaftX_1=[-length/2, shaftZ_posY+M*3, shaftX_posZ+length+M*3-correction];


shaftY_0=[shaftY_posX+Mx,-lnConnect/2,(Mx-correction)*2];
shaftY_1=[shaftY_posX+lnConnect*2-Mx,-lnConnect/2,(Mx-correction)*2];

shaftZ_left0=[-lnConnect+M+Mx_2, shaftZ_posY+Mx, lnConnect/2+Mx_2+correction];
shaftZ_left1=[-lnConnect+M+Mx_2, shaftZ_posY+lnConnect*2-Mx, lnConnect/2+Mx_2+correction];
shaftZ_right0=[lnBase+lnConnect-M-Mx_2, shaftZ_posY+Mx, lnConnect/2+Mx_2+correction];
shaftZ_right1=[lnBase+lnConnect-M-Mx_2, shaftZ_posY+lnConnect*2-Mx, lnConnect/2+Mx_2+correction];


module chassis_axisX() {
	connector_M8_shaftX(posX=lnBase+lnConnect-Mx, posY=shaftZ_posY, posZ=shaftX_posZ+Mx+M, rotZ=90);
	mirror([0,1,0])
		connector_M8_shaftX(posX=-lnConnect+Mx, posY=-shaftZ_posY, posZ=shaftX_posZ+Mx+M, rotZ=-90);

	// --- X shafts
	shaft_8x350_x(shaftX_0[0],shaftX_0[1],shaftX_0[2]);
	LLMK8UU_xp(shaftX_0[0]+100,shaftX_0[1],shaftX_0[2]);
	LLMK8UU_xn(shaftX_0[0]+200,shaftX_0[1],shaftX_0[2]);

	shaft_8x350_x(shaftX_1[0],shaftX_1[1],shaftX_1[2]);
	LLMK8UU_xp(shaftX_1[0]+100,shaftX_1[1],shaftX_1[2]);
	LLMK8UU_xn(shaftX_1[0]+200,shaftX_1[1],shaftX_1[2]);
}//axisY
chassis_axisX();
// --- Z left shafts
