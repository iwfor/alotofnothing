// Model by Isaac Foraker
//
// Released under Creative Commons Attribution 4.0 International (CC BY 4.0)
// https://creativecommons.org/licenses/by/4.0/

// Spindle to fit a Polymaker 5kg spool

include <common.scad>

h = track_wall_thickness+2;
w = 55;
r = w/2;

cylinder(r1=r-2,r2=r,h=2);
translate([0,0,2]) cylinder(r=r, h=8);
translate([0,0,10]) {
    cylinder(r=5.975, h=h);
    translate([0,0,h])
        cylinder(r1=5, r2=4.8, h = track_wall_thickness+6);
}
