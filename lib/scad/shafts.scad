fn_8mm = 20;
//shaft_8x350_x(posX, posY, posZ);
//shaft_8x350_y(posX, posY, posZ);
//shaft_8x350_z(posX, posY, posZ);

module shaft_8x350_x(posX=0,posY=0,posZ=0){
	translate([posX,posY,posZ])
		rotate([0,90,0])
			color("blue")
				cylinder(350,4,4, $fn=fn_8mm);
}

module shaft_8x350_y(posX=0,posY=0,posZ=0){
	translate([posX,posY,posZ])
		rotate([-90,0,0])
			color("lightblue")
				cylinder(350,4,4, $fn=fn_8mm);
}

module shaft_8x350_z(posX=0,posY=0,posZ=0){
	translate([posX,posY,posZ])
		rotate([0,0,90])
			color("darkblue")
				cylinder(350,4,4, $fn=fn_8mm);
}

