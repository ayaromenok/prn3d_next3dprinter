include <../../lib/scad/shafts.scad>
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

// --- X
shaft_8x350_x(shaftX_0[0],shaftX_0[1],shaftX_0[2]);
LLMK8UU_xp(shaftX_0[0]+100,shaftX_0[1],shaftX_0[2]);
LLMK8UU_xn(shaftX_0[0]+200,shaftX_0[1],shaftX_0[2]);

shaft_8x350_x(shaftX_1[0],shaftX_1[1],shaftX_1[2]);
LLMK8UU_xp(shaftX_1[0]+100,shaftX_1[1],shaftX_1[2]);
LLMK8UU_xn(shaftX_1[0]+200,shaftX_1[1],shaftX_1[2]);


// --- Y
shaft_8x350_y(shaftY_0[0],shaftY_0[1],shaftY_0[2]);
LLMK8UU_yp(shaftY_0[0],shaftY_0[1]+100,shaftY_0[2]);
LLMK8UU_yn(shaftY_0[0],shaftY_0[1]+200,shaftY_0[2]);

shaft_8x350_y(shaftY_1[0],shaftY_1[1],shaftY_1[2]);
LLMK8UU_yp(shaftY_1[0],shaftY_1[1]+100,shaftY_1[2]);
LLMK8UU_yn(shaftY_1[0],shaftY_1[1]+200,shaftY_1[2]);

// --- Z left
shaft_8x350_z(shaftZ_left0[0],shaftZ_left0[1],shaftZ_left0[2]);
LLMK8UU_zp(shaftZ_left0[0],shaftZ_left0[1],shaftZ_left0[2]+75);
LLMK8UU_zn(shaftZ_left0[0],shaftZ_left0[1],shaftZ_left0[2]+175);

shaft_8x350_z(shaftZ_left1[0],shaftZ_left1[1],shaftZ_left1[2]);
LLMK8UU_zp(shaftZ_left1[0],shaftZ_left1[1],shaftZ_left1[2]+75);
LLMK8UU_zn(shaftZ_left1[0],shaftZ_left1[1],shaftZ_left1[2]+175);

// --- Z right
shaft_8x350_z(shaftZ_right0[0],shaftZ_right0[1],shaftZ_right0[2]);
LLMK8UU_zp(shaftZ_right0[0],shaftZ_right0[1],shaftZ_right0[2]+75);
LLMK8UU_zn(shaftZ_right0[0],shaftZ_right0[1],shaftZ_right0[2]+175);

shaft_8x350_z(shaftZ_right1[0],shaftZ_right1[1],shaftZ_right1[2]);
LLMK8UU_zp(shaftZ_right1[0],shaftZ_right1[1],shaftZ_right1[2]+75);
LLMK8UU_zn(shaftZ_right1[0],shaftZ_right1[1],shaftZ_right1[2]+175);

