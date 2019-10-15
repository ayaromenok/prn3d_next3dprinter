include <../../settings/scad/global.scad>
include <../../lib/scad/shafts.scad>
include <../../lib/scad/threadedBars.scad>
include <../../lib/scad/nuts.scad>
include <../../prn_200x200x200/scad/connector_m8.scad>
include <../../prn_200x200x200/scad/basement.scad>
include <../../prn_200x200x200/scad/chassis_axisY.scad>
include <../../prn_200x200x200/scad/chassis_axisZ.scad>


shaftX_0=[0,shaftX_posY,100];
shaftX_1=[0,shaftX_posY,150];

//WiP
basement();
chassis_axisY();
chassis_axisZ();

// --- X shafts
shaft_8x350_x(shaftX_0[0],shaftX_0[1],shaftX_0[2]);
LLMK8UU_xp(shaftX_0[0]+100,shaftX_0[1],shaftX_0[2]);
LLMK8UU_xn(shaftX_0[0]+200,shaftX_0[1],shaftX_0[2]);

shaft_8x350_x(shaftX_1[0],shaftX_1[1],shaftX_1[2]);
LLMK8UU_xp(shaftX_1[0]+100,shaftX_1[1],shaftX_1[2]);
LLMK8UU_xn(shaftX_1[0]+200,shaftX_1[1],shaftX_1[2]);
