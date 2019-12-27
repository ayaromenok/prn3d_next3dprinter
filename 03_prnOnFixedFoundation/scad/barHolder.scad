R = 4;
FN = 4;
HR = 10;
M3_2 = 1.5;

bxW = 20;
bxH = 20;
bxD = 20;

difference(){
    cylinder(HR,2*R, 1.5*R, $fn=R*2*2*FN);
    cylinder(HR+1,R+0.2, R+0.4, $fn=R*2*FN);
}

difference(){
translate([0, bxH/2, -5])
    rotate([90,0,0])
    linear_extrude(bxH)
        import("../dxf/barHolderSide.dxf");

translate([27,5,-10])
    cylinder(10, M3_2+0.4, M3_2+0.4, $fn=M3_2*2*FN);
translate([27,5,-6])
    cylinder(3, M3_2*2.5, M3_2+0.4, $fn=M3_2*2*2*FN);
translate([27,-5,-10])
    cylinder(10, M3_2+0.4, M3_2+0.4, $fn=M3_2*2*FN);
translate([27,-5,-6])
    cylinder(3, M3_2*2.5, M3_2+0.4, $fn=M3_2*2*2*FN);

translate([15,5,20])
    rotate([0,90,0])
        cylinder(10, M3_2+0.4, M3_2+0.4, $fn=M3_2*2*FN);
translate([15,5,20])
    rotate([0,90,0])
        cylinder(3, M3_2*2.5, M3_2+0.4, $fn=M3_2*2*2*FN);
        
translate([15,-5,20])
    rotate([0,90,0])
        cylinder(10, M3_2+0.4, M3_2+0.4, $fn=M3_2*2*FN);
translate([15,-5,20])
    rotate([0,90,0])
        cylinder(3, M3_2*2.5, M3_2+0.4, $fn=M3_2*2*2*FN);        
    }