/*
* This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
* http://creativecommons.org/licenses/by-nc-sa/4.0/
*
* Author: Isaac Foraker
*/

$fn=60;
ss = 278;


module screw_end() {
    difference() {
        union() {
            cylinder(r=15, h=10);
            translate([0,-15,0])
                cube([30,30,10]);
        }
        translate([0,0,-0.01])
            cylinder(r=3,h=10.02);
        translate([0,0,6])
            cylinder(r=8,h=5);
    }
}

module basic_shape() {
    screw_end();
    translate([ss, 0, 0]) rotate([0,0,180]) screw_end();
    b = 9;
    r = 10;
    translate([b,-15,0]) {
        cube([ss-b*2,30,20]);
        translate([r,0,20]) rotate([-90,0,0]) cylinder(r=r,h=30);
        translate([ss-b*2-r,0,20]) rotate([-90,0,0]) cylinder(r=r,h=30);
        translate([b,0,20]) cube([ss-b*2-r*2,30,r]);
    }
}

module hole() {
    rotate([-90,0,0]) {
        cylinder(r1=10,r2=1, h=22.81);
        translate([0,0,22.8])
            cylinder(r=1,h=5.02);
        translate([0,0,24])
            cylinder(r=4.5,h=6.02);
    }
}


rotate([90,0,0]) difference() {
    basic_shape();
    translate([ss/2, -15.01, 15]) {
        hole();
        for (i = [1,2]) {
            translate([i*50,0,0]) hole();
            translate([-i*50,0,0]) hole();
        }
    }
}

