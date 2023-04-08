include <common.scad>

$fn=32;

wall_height = 20;

module top() {
    difference() {
        cube([l, w, t]);
        for (i = [1:7]) {
            translate([t+5, 7.75*i+t, 0]) slat();
        }
    }
    translate([0,0,t]) {
        // bottom wall
        difference() {
            cube([l,t,wall_height]);
            // Ribbon connector
            translate([t+17.5,-0.01,wall_height-2])
                cube([21,t+0.02,5]);
            // USB-C
            translate([t+40.5,-0.01,wall_height-4])
                cube([9.25,t+0.02,5]);
            // HDMI
            translate([t+54.75,-0.01,wall_height-6.5])
                cube([15.5,t+0.02,7]);
            // Audio
            translate([t+74.5,-0.01,wall_height-5.6])
                cube([6.4,t+0.02,7]);
            // USB-C
            translate([t+84,-0.01,wall_height-4])
                cube([9.25,t+0.02,5]);
        }
        // left wall
        difference() {
            cube([t,w,wall_height]);
            // Vertical USB-A
            translate([-0.01,t+7.75,wall_height-15])
                cube([t+0.02,6,16]);
            // Ethernet
            translate([-0.01,t+19,wall_height-14])
                cube([t+0.02,16.5,15]);
            // Stacked USB-A
            translate([-0.01,t+40,wall_height-16.5])
                cube([t+0.02,15,18]);
        }
        // top wall
        translate([0,w-t,0]) cube([l,t,wall_height]);
        // right wall
        difference() {
            translate([l-t,0,0]) cube([t,w,wall_height]);
            // Reset button
            translate([l-t-0.01,t+14,wall_height-2.25]) {
                cube([t+0.02,3,5]);
                translate([0,1.5,0]) rotate([0,90,0]) cylinder(h=t+0.02, r=1.5);
            }
            // MicroSD
            translate([l-t-0.01,t+39.5,wall_height-2.5])
                cube([t+0.02,15,5]);
        }
    }
    
    translate([t+post_offset,t+post_offset,t]) post();
    translate([l-t-post_offset,t+post_offset,t]) post();
    translate([t+post_offset,w-t-post_offset,t]) post();
    translate([l-t-post_offset,w-t-post_offset,t]) post();
}

module post() {
    difference() {
        cylinder(h=wall_height-0.4, r=2.5);
        translate([0,0,wall_height-6])
            cylinder(h=6.01, r=1.33);
    }
}

top();