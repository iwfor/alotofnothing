$fn=24;
t = 3;
l = 50;
h = 30;
s = 12.75; // shelf thickness (want this snug)
lip = 10; // how far under shelf lip should extend

// Draw the basic corner part
module part1() {
    cube([l, h, t]);
    cube([l, t, lip+t]);
    translate([0, t+s, 0])
        cube([t, h-t-s, l]);

    // Under shelf parts
    translate([0, t+s, t]) {
        cube([l, t, lip]);
    }
    translate([t, t+s, 0]) {
        cube([lip, t, l]);
    }
}


module part2() {
    difference() {
        // Add a nail/screw hole
        part1();
        translate([l/2, t + s/2, -0.01]) {
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
}

part2();
translate([-5, 0, 0]) mirror([1, 0, 0])
    part2();
