// Model by Isaac Foraker
//
// Released under Creative Commons Attribution 4.0 International (CC BY 4.0)
// https://creativecommons.org/licenses/by/4.0/

include <common.scad>

h = track_wall_thickness+2;

cylinder(r=17.5, h=10);
translate([0,0,10]) {
    cylinder(r=5.95, h=h);
    translate([0,0,h])
        cylinder(r1=5.95, r2=4.95, h = track_wall_thickness);
}