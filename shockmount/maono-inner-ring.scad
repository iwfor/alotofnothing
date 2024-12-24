// Replacement for the inner ring for the Maono PD200X/XS Shock Mount
//
// The original ring is lined with rubber on the inside, but this is part of what makes it too thin and prone to snapping.

$fn = 64;
d = 55;  // Diameter of microphone
r = d/2;
h = 10;
t = 3;
c = 15;

module part1() {
    difference() {
        cylinder(h = 10, r = r+3.6);
        translate([0,0,-0.01])
            cylinder(h=10.1, r = r);
    }
}

// Cut the release opening
module part2() {
    difference() {
        union() {
            part1();
            translate([r,-c/2,-3]) {
                difference() {
                    rotate([10,0,0]) difference() {
                        cube([c, c, h+3]);
                        // Cut the screw hole
                        translate([c-6,-2,c-7]) rotate([-90,0,0]) {
                            cylinder(r=1.5, h=25);
                            rotate([0,0,30])
                                cylinder(r=2.8, h=5, $fn=6);
                            translate([0,0,c+1.5]) cylinder(r=3, h=6);
                        }
                    }
                    // Cut the bottom flat
                    translate([-0.01, -2, 0])
                        cube([c+0.02, c+4, 3]);
                }
            }
        }
        // Cut the separator
        translate([r-2,-1.5,-3])
            rotate([10,0,0]) cube([c+5, 3, h+5]);
    }
}

module part3() {
    // Cut the flower petals
    difference() {
        union() {
            part2();
            rotate([0,0,45]) {
                for (i = [0:3]) {
                    rotate([0,0,i*90])
                        translate([r-1,0,0]) cylinder(r=8,h=h);
                }
            }
        }
        rotate([0,0,45]) {
            for (i = [0:3]) {
                rotate([0,0,i*90])
                    translate([r-1,0,-0.01])
                        cylinder(r=8-t,h=h+0.1);
            }
        }
        translate([0,0,-0.01]) cylinder(r=r, h=h+0.1);
    }
    
    // Add the grippers
    for (n = [90,180,270]) {
        for (i = [-14,0,14]) {
            rotate([0,0,n+i]) translate([r+0.5,-2,h/2]) {
                rotate([-90,0,0]) cylinder(r=2, h=4);
            }
        }
    }
    for (i = [-14,14]) {
        rotate([0,0,i]) translate([r+0.5,-2,h/2]) {
            rotate([-90,0,0]) cylinder(r=2, h=4);
        }
    }
}

part3();