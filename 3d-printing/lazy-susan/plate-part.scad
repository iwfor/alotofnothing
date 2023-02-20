// Model by Isaac Foraker
//
// Released under Creative Commons Attribution 4.0 International (CC BY 4.0)
// https://creativecommons.org/licenses/by/4.0/

include <common.scad>
include <MCAD/2Dshapes.scad>

linear_extrude(track_wall_thickness+2)
    donutSlice(6,170, -30, 30);
    
translate([0,0,track_wall_thickness+2]) {
    for (a = [1/3,4/5]) {
        for (b = [0, 1]) mirror([0,b,0]) {
            rotate([0,0,-30]) {
                translate([track_rad*a,0,-0.01]) {
                    intersection() {
                        cylinder(h=track_wall_thickness+1, r=4);
                        translate([-4,0,0]) cube([8, 4, 10]);
                    }
                }
            }
        }
    }
}
