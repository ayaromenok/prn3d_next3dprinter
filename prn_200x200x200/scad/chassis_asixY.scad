include <../../settings/scad/global.scad>
include <../../lib/scad/shafts.scad>
include <../../prn_200x200x200/scad/connector_m8.scad>
include <../../prn_200x200x200/scad/basement.scad>

shaftX_posY = 90;
shaftY_posZ = 10;
shaftZ_left_posX = 0;
shaftZ_right_posX = 350;

shaftX_0=[0,shaftX_posY,100];
shaftX_1=[0,shaftX_posY,150];

shaftY_0=[130,0,shaftY_posZ];
shaftY_1=[220,0,shaftY_posZ];

shaftZ_left0=[shaftZ_left_posX,100,0];
shaftZ_left1=[shaftZ_left_posX,150,0];
shaftZ_right0=[shaftZ_right_posX,100,0];
shaftZ_right1=[shaftZ_right_posX,150,0];

connector_M8_shaftY();
basement();


// --- Y shafts
shaft_8x350_y(shaftY_0[0],shaftY_0[1],shaftY_0[2]);
LLMK8UU_yp(shaftY_0[0],shaftY_0[1]+100,shaftY_0[2]);
LLMK8UU_yn(shaftY_0[0],shaftY_0[1]+200,shaftY_0[2]);

shaft_8x350_y(shaftY_1[0],shaftY_1[1],shaftY_1[2]);
LLMK8UU_yp(shaftY_1[0],shaftY_1[1]+100,shaftY_1[2]);
LLMK8UU_yn(shaftY_1[0],shaftY_1[1]+200,shaftY_1[2]);