fn = 2;
fn_8mm 	 = 8*fn;
fn_15mm  = 15*fn;
fn_6mm = 6*fn;
fn_3mm = 3*fn;
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
				cylinder(5,3.3,3.3,$fn=fn_6mm);
			translate([12*sin(angle),12*cos(angle),0])
				cylinder(5,1.7,1.7,$fn=fn_3mm);
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

//LLMK8UU_xp();
//LLMK8UU_yp();
//LLMK8UU_zp();