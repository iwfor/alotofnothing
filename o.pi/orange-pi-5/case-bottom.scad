/*
* This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
* http://creativecommons.org/licenses/by-nc-sa/4.0/
*
* Author: Isaac Foraker
*/

include <common.scad>

$fn=32;

module base() {
    difference() {
        cube([l, w, t]);
        for (i = [1:7]) {
            translate([t+5, 7.75*i+t, 0]) slat();
        }
    }
    translate([t+post_offset,t+post_offset,t]) post();
    translate([l-t-post_offset,t+post_offset,t]) post();
    translate([t+post_offset,w-t-post_offset,t]) post();
    translate([l-t-post_offset,w-t-post_offset,t]) post();
    translate([0,0,t]) {
        difference() {
            cube([l,t,post_height+1.5]);
            // Ribbon port
            translate([t+62,-0.01,t+post_height-3.5])
                cube([21,t+0.02,4]);
        }
        difference() {
            cube([t,w,post_height+1.5]);
            translate([-0.01, w/2-4, post_height-0.5]) cube([t+0.02, 8, 5]);
        }
        translate([0,w-t,0]) cube([l,t,post_height+1.5]);
        difference() {
            // Cut notches to make it easier to remove the board with a tool
            translate([l-t,0,0]) cube([t,w,post_height+1.5]);
            translate([l-t-0.01, w/2-4, post_height-0.5]) cube([t+0.02, 8, 5]);
        }
    }
}

module post() {
    cylinder(h=post_height, r=2.5);
    cylinder(h=post_height+3, r=1.33);
    translate([0,0,post_height+3]) sphere(r=1.33);
}

base();
