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
            cylinder(r=spool_r,h=spool_w);
            translate([0,0,-0.01]) cylinder(r=spool_r-barrel_wall,h=spool_w-15.9);
            // cut threads
            translate([0,0,spool_w-17]) {
                metric_thread(diameter=thread_dia,pitch=5,length=17.1);
            }
            // cut zip-tie channels
            translate([-spool_r-0.1,-3,0]) linear_extrude(spool_w+0.1) square([spool_r*2+0.2,6]);
            translate([-3,-spool_r-0.1,0]) linear_extrude(spool_w+0.1) square([6,spool_r*2+0.2]);
        }
    }
}

solid1();
