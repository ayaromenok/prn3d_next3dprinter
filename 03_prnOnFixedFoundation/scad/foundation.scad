module foundation(pX=0, pY=0, pZ=0, rZ=0){
    translate([(pX-220), (pY-208), pZ])
        rotate([0,0,rZ])
            cube([440,426,17]);
}

//foundation();