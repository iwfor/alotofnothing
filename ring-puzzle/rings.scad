module ring(r,h) {
    linear_extrude(height=h) difference() {
        circle(r=r, $fn=64);
        circle(r-3.5, $fn=64);
    }
}

xoff=40;

numrings = 5;
translate([-xoff,0,0]) {
    for (i = [1:numrings]) {
        ring(i*4+5, numrings*2+6-(i*2));
    }
}

maxr=(numrings+1)*4+5;
translate([xoff,0,0]) {
    translate([0,0,2]) ring(maxr, 5);
    difference() {
        linear_extrude(height=2) circle(r=maxr, $fn=64);
        translate([0,0,-1]) linear_extrude(height=4) circle(r=2, $fn=64);
    }
}
