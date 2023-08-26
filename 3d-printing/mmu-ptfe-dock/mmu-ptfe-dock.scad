/*
* This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
* http://creativecommons.org/licenses/by-nc-sa/4.0/
*
* Author: Isaac Foraker
*/

$fn=60;
ss = 279;
d = 16; // depth
h = 20; // height

module screw_end() {
    difference() {
        translate([-d/2,-d/2,0])
            cube([d+5,d,10]);
        translate([0,0,-0.01])
            cylinder(r=3,h=10.02);
        translate([0,0,6])
            cylinder(r=6.5,h=5);
    }
}

module basic_shape() {
    screw_end();
    translate([ss, 0, 0]) rotate([0,0,180]) screw_end();
    b = 9;
    r = h/3;
    translate([b,-d/2,0]) {
        cube([ss-b*2,d,h*2/3]);
        translate([r,0,h*2/3]) rotate([-90,0,0]) cylinder(r=r,h=d);
        translate([ss-b*2-r,0,h*2/3]) rotate([-90,0,0]) cylinder(r=r,h=d);
        translate([r,0,h*2/3]) cube([ss-b*2-r*2,d,r]);
    }
}

module hole() {
    rotate([-90,0,0]) {
        cylinder(r1=6,r2=1, h=4);
        cylinder(r1=3, r2=1.05,h=d-5.02);
        translate([0,0,d-6])
            cylinder(r=4.6,h=6.02);
    }
}

//translate([40,45,0]) hole();

rotate([90,0,0]) difference() {
    basic_shape();
    translate([ss/2, -d/2-0.01, h/2]) {
        hole();
        for (i = [1,2]) {
            translate([i*50,0,0]) hole();
            translate([-i*50,0,0]) hole();
        }
    }
}

