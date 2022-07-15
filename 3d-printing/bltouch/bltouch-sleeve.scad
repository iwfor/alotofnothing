/*
* This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
* http://creativecommons.org/licenses/by-nc-sa/4.0/
*
* Author: Isaac Foraker
*/

$fn=64;
w=10.5;
d=13.3;
r=d/2;
h=10;

module inside() {
    intersection() {
        union() {
            translate([0,0,h-7.5]) sphere(r=7.5);
            translate([-r,-w/2,0]) cube([r*2,w,h-4.5]);
        }
        union() {
            cylinder(h=h, r=r);
            translate([-r,0,0]) cube([r*2,w/2,h]);
        }
        translate([-r,-w/2,0]) cube([r*2, w, h]);
    }
    cylinder(h=h+4, r=2.5);
}

module outside() {
    h2=h+3;
    r2=r+1;
    w2=w+2;
    intersection() {
        translate([0,0,h2-10]) sphere(r=10);
        union() {
            cylinder(h=h2, r=r2);
            translate([-r2,0,0]) cube([r2*2,w2/2,h2]);
        }
        translate([-r2,-w2/2,0]) cube([r2*2, w2, h2]);
    }
}

difference() {
    outside();
    translate([0,0,-0.01]) inside();
}