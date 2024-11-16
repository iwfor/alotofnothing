// Model by Isaac Foraker
//
// Released under Creative Commons Attribution 4.0 International (CC BY 4.0)
// https://creativecommons.org/licenses/by/4.0/

// Spindle to fit a Polymaker 5kg spool

include <common.scad>

h = track_wall_thickness+5;

cylinder(r1=14,r2=16,h=2);
translate([0,0,2]) cylinder(r=16, h=8);
translate([0,0,10]) {
    cylinder(r=5.975, h=h);
    translate([0,0,h])
        cylinder(r1=5.975, r2=4.975, h = track_wall_thickness);
}
