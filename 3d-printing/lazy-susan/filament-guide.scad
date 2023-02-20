// Model by Isaac Foraker
//
// Released under Creative Commons Attribution 4.0 International (CC BY 4.0)
// https://creativecommons.org/licenses/by/4.0/

$fn=64;
height = 130;

module post() {
    // Make the post
    intersection() {
        translate([0,-3,0])
            cube([height, 6, 6]);
        translate([0,0,3]) rotate([0,90,0])
            cylinder(h=height,r=3.5);
    }
}

// Make the donut guide
intersection() {
    translate([0,0,2.25]) rotate_extrude(angle=360, convexity=2)
        translate([15,0,0]) circle(4);
    cylinder(r=15, h=6);
}
translate([14,0,0]) post();

// Make the stand
s = 45;
translate([s+15,s+15,0]) {
    rotate_extrude(angle=360, convexity=2)
        translate([s,0,0]) square([5,2.5]);
    translate([-2.5,-s,0]) cube([5,s*2,2.5]);
    translate([-s,-2.5,0]) cube([s*2,5,2.5]);
    difference() {
        cylinder(r=6,h=15);
        rotate([0,-90,0]) translate([0,0,-3])post();
        translate([-10,-0.25])
            cube([20,0.5,25]);
    }
}
