// Model by Isaac Foraker
//
// Released under Creative Commons Attribution 4.0 International (CC BY 4.0)
// https://creativecommons.org/licenses/by/4.0/

include <common.scad>

h = wheel_hole_rad*1.5;  // Do not want full diameters
spokes = 8;
axle = wheel_width + track_wall_thickness;

#ring(track_rad - 2, 2.5, h);

for (i = [0:(spokes-1)]) rotate([0,0,i*(360/spokes)]) {
    translate([track_rad, 0, 0]) {
        difference() {
            union() {
                intersection() {
                    translate([0, -wheel_hole_rad, 0])
                        cube([axle, wheel_width*2, h]);
                    translate([0, 0, h/2]) rotate([0,90,0])
                        cylinder(h = axle, r=wheel_hole_rad-0.1);
                }
                intersection() {
                    translate([0, -wheel_hole_rad-1.5, 0])
                        cube([axle, wheel_hole_rad*2+3, h]);
                    translate([0, 0, h/2]) rotate([0,90,0])
                        cylinder(h = 1.75, r=wheel_hole_rad+1.5);
                }
            }
            translate([0, -0.25,-0.01])
                cube([axle+3, 0.5, h+0.02]);
        }
    }
}
