$fn=24;
t = 3;
l = 50;
h = 30;
s = 12.75; // shelf thickness (want this snug)
lip = 10; // how far under shelf lip should extend

// Draw the basic corner part
module part1() {
    cube([l, h, t]);
    cube([l, t, t+lip]);
    cube([t+lip, t, l]);
    cube([t, h, l]);

    // Under shelf parts
    translate([0, t+s, t]) {
        cube([l, t, lip]);
    }
    translate([t, t+s, 0]) {
        cube([lip, t, l]);
    }
}


difference() {
    part1();
    // Add a couple nail/screw holes
    translate([l*3/4, t + s/2, -0.01]) {
        cylinder(h=t+1, r=2);
        cylinder(h=2, r1=4, r2=2);
    }
    translate([-0.01, t+s/2, l*3/4])
        rotate([0, 90, 0]) {
            cylinder(h=t+1, r=2);
            cylinder(h=2, r1=4, r2=2);
        }

    // Cut out holes for rack screws
    a=20+t;
    ar=11;
    translate([t+a, h, -0.01])
        cylinder(h=t+1, r=ar);
    translate([-0.01, h, t+12])
        rotate([0,90,0])
        cylinder(h=t+1, r=ar);
}
