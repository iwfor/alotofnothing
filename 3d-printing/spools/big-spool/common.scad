/*
 * This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
 * http://creativecommons.org/licenses/by-nc-sa/4.0/
 *
 * Author: Isaac Foraker
 *
 * This work makes use of the following libraries:
 *  Round-Anything library by IrevDev
 *  ISO-standard Metric Threads library by Dan Kirshner
 */

include <MCAD/2Dshapes.scad>
include <polyround.scad>
include <threads.scad>

$fn = 64;

inside_dia = 45;
inside_r = inside_dia/2;
spool_dia = 65;
spool_r = spool_dia/2;
//spool_w = 58;
spool_w = 88;
wrapped_dia = 180;
wheel_dia = wrapped_dia+20;
wheel_r = wheel_dia/2;
wall = 3.5;
barrel_wall = 4;
ring = 2;
thread_dia = spool_dia-barrel_wall*2;

module wheel() {
    difference() {
        cylinder(r=wheel_r, h=wall);
        translate([0,0,-1]) cylinder(r=inside_r+ring+0.5,h=wall+2);
        // Cut filament lock holes
        for (i = [0:12]) {
            rotate([0,0,i*30]) {
                #translate([wheel_r-5,0,-0.01]) cylinder(r1=3,r2=1.75,h=wall+0.2);
            }
        }
        // Make big cutouts
        for (i = [0:4]) {
            rotate([0,0,i*360/5]) {
                translate([0, spool_dia/2, -0.1]) cutout();
            }
        }
    }
}

module cutout() {
    size = 45;
    top_r = 46;
    bottom_r = 19;
    r = [80,20,30,50];
    p = [ [-bottom_r,0,20],[0,3,20],[bottom_r,0,20],
        [top_r,size,10],[20,size+9,10],[0,size+12,10],[-20,size+9,10],[-top_r,size,10] ];
    color("yellow") linear_extrude(wall+0.2) polygon( polyRound(p,10));
}
