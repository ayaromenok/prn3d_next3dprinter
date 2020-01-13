include <../../lib_v2/scad/nema17.scad>
include <../../lib_v2/scad/endStop.scad>

botZAxisHolder(_showMetall = true);

R=4;
Fn=4;
HR=10;
module barHolderM8V(pX=0, pY=0, pZ=0, rX=0, rY=0, rZ=0, clr="grey", _showMetall = false)
{
    translate([pX, pY, pZ])
    rotate([rX, rY, rZ])
    color(clr)
    {
        difference(){
            union(){
                cylinder(HR,2*R, 1.5*R, $fn=R*2*2*Fn);
                cylinder(HR/4, 2.3*R, 1.5*R, $fn=R*2*2*Fn);
                translate([0,0,0])
                    cylinder(0, 2.3*R, 2.3*R, $fn=R*2*2*Fn);
            }//union
            cylinder(HR+1,R+0.2, R+0.4, $fn=R*2*Fn);
        }//diff
        //bar
        if (_showMetall){
            translate([0,0,0])
                cylinder(300,4,4, $fn=3);
        }
    }//transform    
} //barHolder

module botZAxisHolder(pX=0, pY=0, pZ=0, rX=0, rY=0, rZ=0, clr="grey", _showMetall = false)
{
    translate([pX, pY, pZ])
    rotate([rX, rY, rZ])
    color(clr)
    {
        barHolderM8V(pZ=46,_showMetall=true);
        nema17Holder(pX=-32, pY=0, pZ=43, rX=0, rY=-90, rZ=180);        
        endStopHolder(pX=0, pY=25, pZ=30, rX=90, rY=0, rZ=180, sizeY=45);
        if(_showMetall){
            nema17(pX=-32, pY=0, pZ=43, rX=0, rY=-90, rZ=0);
//            nema17GT2Puley(pX=-8, pY=-11, pZ=21.2, rX=0, rY=0, rZ=90);        
            endStop(pX=-0, pY=32, pZ=30, rX=90, rY=0, rZ=180);
        }
    }//transform
}//module botZAxisHolder    