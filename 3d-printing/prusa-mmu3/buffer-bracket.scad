/*
* This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
* http://creativecommons.org/licenses/by-nc-sa/4.0/
*
* Author: Isaac Foraker
*/

$fn=32;
height = 65.5; // mm
width = 112; // mm
w2 = 15;
t = 4;

module part1() {
    cube([width+t*2, t, w2]);
    translate([0,t,0])
        cube([t, height, w2]);
    translate([width+t,t,0])
        cube([t, height, w2]);
    translate([-15, height, 0]) {
        cube([15, t, w2]);
        translate([0, 0, w2/2]) rotate([-90,0,0])
            cylinder(r=w2/2, h=t);
    }
    translate([width+t*2, height, 0]) {
        cube([15, t, w2]);
        translate([15, 0, w2/2]) rotate([-90,0,0])
            cylinder(r=w2/2, h=t);
    }
}

module part2() {
    difference() {
        part1();
        translate([-15, height-1, w2/2]) rotate([-90,0,0])
            cylinder(r=2.5, h=t+2);
        translate([width+t*2+15, height-1, w2/2]) rotate([-90,0,0])
            cylinder(r=2.5, h=t+2);
    }
}

part2();