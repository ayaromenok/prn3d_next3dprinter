module foundation(pX=0, pY=0, pZ=0, rZ=0, clr="lightgrey"){
    sizeX=440;
    sizeY=426;
    sizeZ=17;
    translate([(pX-sizeX/2), (pY-sizeY/2), pZ])
        rotate([0,0,rZ])
            color(clr)
                cube([sizeX, sizeY, sizeZ]);
}

//foundation();