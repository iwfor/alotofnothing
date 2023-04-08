// 100mm x 62mm x 5mm (inside)

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
            translate([t+62,-0.01,t+post_height-3])
                cube([21,t+0.02,4]);
        }
        cube([t,w,post_height+1.5]);
        translate([0,w-t,0]) cube([l,t,post_height+1.5]);
        translate([l-t,0,0]) cube([t,w,post_height+1.5]);
    }
}

module post() {
    cylinder(h=post_height, r=2.5);
    cylinder(h=post_height+3, r=1.33);
    translate([0,0,post_height+3]) sphere(r=1.33);
}

base();
