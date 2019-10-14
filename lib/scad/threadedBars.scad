//Threaded Bars
include <../../settings/scad/global.scad>

fnl = fn; //fn local

module threadedBar_M8_x(posX=0,posY=0,posZ=0, length=400){
	translate([posX,posY,posZ])
		rotate([0,90,0])
			color("grey")
				cylinder(length,4,4, $fn=8*fnl);
}

module threadedBar_M8_y(posX=0,posY=0,posZ=0, length=400){
	translate([posX,posY,posZ])
		rotate([-90,0,0])
			color("lightgrey")
				cylinder(length,4,4, $fn=8*fnl);
}
module threadedBar_M8_z(posX=0,posY=0,posZ=0, length=400){
	translate([posX,posY,posZ])
		rotate([0,0,90])
			color("darkgrey")
				cylinder(length,4,4, $fn=8*fnl);
}