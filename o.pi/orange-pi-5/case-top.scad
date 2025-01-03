/*
* This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
* http://creativecommons.org/licenses/by-nc-sa/4.0/
*
* Author: Isaac Foraker
*/

include <common.scad>

$fn=32;

wall_height = 20;

//fan_middle_x = l - t - fan_side/2;
//fan_middle_y = w - t*6 - fan_side/2;
fan_middle_x = l/2;
fan_middle_y = w/2;

module top1() {
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
            translate([t+17.5,-0.01,wall_height-2.5])
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
                cube([t+0.02,6.5,16]);
            // Ethernet
            translate([-0.01,t+19.2,wall_height-14])
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
    
    color("red") {
        // bottom left
        translate([t+post_offset,t+post_offset,t]) post();
        // top left
        translate([l-t-post_offset,t+post_offset,t]) post();
        // bottom right
        translate([t+post_offset,w-t-post_offset,t]) post();
        // top right
        translate([l-t-post_offset,w-t-post_offset,t]) post();
    }
}

module post() {
    difference() {
        cylinder(h=wall_height-0.4, r=2.65);
        translate([0,0,wall_height-6])
            cylinder(h=6.01, r=1.45);
    }
}

module top2() {
    // Take the basic top case and build a spot for a fan
    fw = 4.5;
    difference() {
        union() {
            top1();
            // Create a solid square for the fan before cutting out
            // the opening for the fan, then cut holes in it for
            // optional screws
            translate([fan_middle_x-fan_side/2-t, fan_middle_y-fan_side/2-t-1, 0])
                cube([fan_side+t*2, fan_side+t*2+3, t]);
            color("yellow") translate([fan_middle_x-fan_side/2-t, fan_middle_y-fan_side/2-t, t]) {
                cube([fan_side+t, t, fw]);
                difference(){ 
                    cube([t, fan_side+t*2, fw]);
                    // Cut channel for wires
                    translate([-0.01, fan_side+t-fan_wire_offset-fan_wire_width, 0])
                        cube([t+0.02, fan_wire_width, fan_thickness]);
                }
                translate([fan_side+t, 0, 0]) cube([t, fan_side+t*2, fw]);
                translate([0,fan_side+t,0])
                    cube([fan_side+t, t, fw]);
            }
        }
        // Cut out the big opening for fan airflow
        translate([fan_middle_x, fan_middle_y, -0.01]) {
            cylinder(h=t+0.02, r=fan_opening/2+0.5);
        }
    }
    // Build the fan screen
    color("green") translate([fan_middle_x, fan_middle_y, -0.01]) {
        cylinder(h=1.5, r=7.5);
        for (x = [0:2]) rotate([0,0,120*x+30]) {
            translate([0,-1,0]) cube([fan_side/2, t, 1.5]);
        }
    }
}

module top3() {
    // Cut screw holes into the top
    difference() {
        top2();
        translate([fan_middle_x, fan_middle_y, -0.01]) {
            for (i = [0:3]) rotate([0,0,90*i]) {
                translate([fan_side/2-2.8, fan_side/2-2.8, 0])
                    cylinder(h=t+0.02, r=1.5); // m3 x 10 probably will work
            }
        }
    }
}

top3();
