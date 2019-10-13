fn_8mm 	 = 24;
fn_15mm  = 60;
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

module LMK8UU(){
	difference(){	
		union(){
			cylinder(24,7.5,7.5, $fn=fn_15mm);
			translate([-12.5,-12.5,0])
				cube([25,25,5]);
		}//union
		cylinder(24,4,4, $fn=fn_15mm);
		for(angle = [45:90:350]){
			translate([12*sin(angle),12*cos(angle),(3.3-5)])
				cylinder(5,3.3,3.3,$fn=24);
			translate([12*sin(angle),12*cos(angle),0])
				cylinder(5,1.7,1.7,$fn=16);
		}
	}

	
}
module LLMK8UU_xp(posX=0,posY=0,posZ=0){
	translate([posX,posY,posZ])
		rotate([0,90,0])
			color("blue")
				LMK8UU();
}
module LLMK8UU_xn(posX=0,posY=0,posZ=0){
	translate([posX,posY,posZ])
		rotate([0,-90,0])
			color("blue")
				LMK8UU();
}
module LLMK8UU_yp(posX=0,posY=0,posZ=0){
	translate([posX,posY,posZ])
		rotate([-90,0,0])
			color("lightblue")
				LMK8UU();
}
module LLMK8UU_yn(posX=0,posY=0,posZ=0){
	translate([posX,posY,posZ])
		rotate([90,0,0])
			color("lightblue")
				LMK8UU();
}
module LLMK8UU_zp(posX=0,posY=0,posZ=0){
	translate([posX,posY,posZ])
		rotate([0,0,0])
			color("darkblue")
				LMK8UU();
}
module LLMK8UU_zn(posX=0,posY=0,posZ=0){
	translate([posX,posY,posZ])
		rotate([0,180,0])
			color("darkblue")
				LMK8UU();
}

//LLMK8UU_x();
//LLMK8UU_y();
//LLMK8UU_z();