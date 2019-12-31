R = 4;
Fn = 4;
HR = 10;
M3_2 = 1.5;

bxW = 20;
bxH = 24;
bxD = 20;

difference(){
    cylinder(HR,2*R, 1.5*R, $fn=R*2*2*Fn);
    cylinder(HR+1,R+0.2, R+0.4, $fn=R*2*Fn);
}

difference(){
translate([0, bxH/2, -5])
    rotate([90,0,0])
    linear_extrude(bxH)
        import("../dxf/barHolderSidev2.dxf", $fn=Fn*8);
//holes at back
translate([27,5,-10])
    cylinder(10, M3_2+0.4, M3_2+0.4, $fn=M3_2*2*Fn);
translate([27,5,-6])
    cylinder(3, M3_2*2.5, M3_2+0.4, $fn=M3_2*2*2*Fn);
translate([27,-5,-10])
    cylinder(10, M3_2+0.4, M3_2+0.4, $fn=M3_2*2*Fn);
translate([27,-5,-6])
    cylinder(3, M3_2*2.5, M3_2+0.4, $fn=M3_2*2*2*Fn);

//holse at bottom
translate([15,5,20])
    rotate([0,90,0])
        cylinder(10, M3_2+0.4, M3_2+0.4, $fn=M3_2*2*Fn);
translate([15,5,20])
    rotate([0,90,0])
        cylinder(3, M3_2*2.5, M3_2+0.4, $fn=M3_2*2*2*Fn);
translate([15,-5,20])
    rotate([0,90,0])
        cylinder(10, M3_2+0.4, M3_2+0.4, $fn=M3_2*2*Fn);
translate([15,-5,20])
    rotate([0,90,0])
        cylinder(3, M3_2*2.5, M3_2+0.4, $fn=M3_2*2*2*Fn);        

//additional hole for better holder support
translate([0,0,-7])
    cylinder(HR+1,R/2+0.2, R/2+0.4, $fn=R*2*Fn);
}

//    rotate_extrude($Fn=Fn*10)
//        import("../dxf/barHolderD8.dxf", $Fn=Fn*4); 