include <../../prn_200x200x200/scad/connector_m8.scad>
include <../../lib/scad/threadedBars.scad>
include <../../lib/scad/nuts.scad>

lnBase = 300;			//lengthBase
lnConnect = 50;		//lengthConnect
lnNuts = 10;			//lengthNuts
lnNutsShift = 2;		//M8 Nut ~ 6 mm, so +2 mm from both side will give a lnNuts 10mm value 
Mx = 8;

module threadedBarX(){
	threadedBar_M8_x(posX=-lnConnect-lnNuts, length=lnBase+2*(lnConnect+lnNuts));
	nut_M8_x(posX=-lnConnect-lnNuts+lnNutsShift);
	nut_M8_x(posX=0+lnNutsShift);
	nut_M8_x(posX=lnBase-lnNuts+lnNutsShift);
	nut_M8_x(posX=lnBase+lnConnect+lnNutsShift);
}

module threadedBarY(){
	threadedBar_M8_y(posY=-lnConnect-lnNuts, length=lnBase+2*(lnConnect+lnNuts));
	nut_M8_y(posY=-lnConnect-lnNuts+lnNutsShift);
	nut_M8_y(posY=0+lnNutsShift);
	nut_M8_y(posY=lnBase-lnNuts+lnNutsShift);
	nut_M8_y(posY=lnBase+lnConnect+lnNutsShift);
}

module basement() {
//front X
translate([0,-lnConnect+lnNuts-lnNutsShift,0]){
	connector_M8(posX=-lnConnect, clr="grey");
	connector_M8(posX=lnBase, clr="grey");
	translate([0,0,0]);
		threadedBarX();
	translate([0,lnConnect-Mx*2,0])
		threadedBarX();
	translate([0,(lnConnect-Mx*2)/2,(Mx-1)*4])
		threadedBarX();
}//translate

//back X
translate([0,lnNuts-lnNutsShift,0]){
	connector_M8(posX=-lnConnect, posY=lnBase, clr="grey");
	connector_M8(posX=lnBase, posY=lnBase, clr="grey");
	translate([0,lnBase,0])
		threadedBarX();
	translate([0,lnBase+lnConnect-Mx*2,0])
		threadedBarX();
	translate([0,lnBase+(lnConnect-Mx*2)/2,(Mx-1)*4])
		threadedBarX();
}//translate

// Y bars left
translate([-Mx,0, Mx*2-2])
	threadedBarY();	
translate([-lnConnect+Mx,0, Mx*2-2])
	threadedBarY();	
translate([(-lnConnect)/2,0, Mx*2-2+(Mx-1)*4])
	threadedBarY();	

// Y bars right
translate([lnBase+lnConnect-Mx,0, Mx*2-2])
	threadedBarY();	
translate([lnBase+Mx,0, Mx*2-2])
	threadedBarY();	
translate([lnBase+(lnConnect)/2,0, Mx*2-2+(Mx-1)*4])
	threadedBarY();
}//end of basement

