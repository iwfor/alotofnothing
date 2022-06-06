/*
 * This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
 * http://creativecommons.org/licenses/by-nc-sa/4.0/
 *
 * Author: Isaac Foraker
 */

include <common.scad>

module solid1() {
    wheel();
    translate([0,0,wall]) {
        difference() {
            // Draw the main barrel
            difference() {
                cylinder(r=spool_r,h=spool_w);
                translate([0,50,1.25]) rotate([90,0,0])
                    cylinder(r=1.25, h=100);
                translate([-50,0,1.75]) rotate([0,90,0])
                    cylinder(r=1.75, h=100);
            }
            translate([0,0,-0.01]) cylinder(r=spool_r-barrel_wall,h=spool_w-15.9);
            // cut threads
            translate([0,0,spool_w-17]) {
                metric_thread(diameter=thread_dia,pitch=5,length=17.1);
            }
        }
    }
}

solid1();
