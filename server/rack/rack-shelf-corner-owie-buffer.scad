include <MCAD/2Dshapes.scad>

$fn=16;
t = 3;
l = 25;
s = 12.75; // shelf thickness (want this snug)
lip = 6; // how far under shelf lip should extend
h = t*2+s;

// Draw the basic corner part
module part1() {
    cube([l, h, t]);
    cube([l, t, lip+t]);
    cube([lip+t, t, l]);
    cube([t, h, l]);

    // Under shelf parts
    translate([0, t+s, t]) {
        cube([l, t, lip]);
    }
    translate([t, t+s, 0]) {
        cube([lip, t, l]);
    }
}


// Add a couple nail/screw holes
difference() {
    part1();
    translate([l*3/4, t + s/2, -0.01])
        cylinder(h=t+1, r=2);
    translate([-0.01, t+s/2, l*3/4])
        rotate([0, 90, 0])
            cylinder(h=t+1, r=2);
            
    // Try to round the corner a little
    translate([1.5, -0.01, 1.5]) rotate([-90,0,0])
        linear_extrude(h+1)
            donutSlice(1.5,3, 90,180);
}
