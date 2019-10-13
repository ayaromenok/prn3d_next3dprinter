include <../../lib/scad/shafts.scad>

//shaft_8x350();
shaft_8x350_x(0,90,100);
LLMK8UU_xp(100,90,100);
LLMK8UU_xn(200,90,100);
shaft_8x350_x(0,90,150);
LLMK8UU_xp(100,90,150);
LLMK8UU_xn(200,90,150);

shaft_8x350_y(130,0,10);
LLMK8UU_yp(130,100,10);
LLMK8UU_yn(130,200,10);

shaft_8x350_y(220,0,10);
LLMK8UU_yp(220,100,10);
LLMK8UU_yn(220,200,10);

shaft_8x350_z(0,100,0);
LLMK8UU_zp(0,100,75);
LLMK8UU_zn(0,100,175);
shaft_8x350_z(0,150,0);


shaft_8x350_z(350,100,0);
shaft_8x350_z(350,150,0);