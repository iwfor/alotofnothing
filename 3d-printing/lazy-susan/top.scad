// Model by Isaac Foraker
//
// Released under Creative Commons Attribution 4.0 International (CC BY 4.0)
// https://creativecommons.org/licenses/by/4.0/

include <common.scad>

ring(track_rad-2, track_width+track_wall_thickness*3+3, track_wall_thickness);
ring(track_rad, track_wall_thickness, track_wall_thickness+wheel_rad/2);
ring(track_rad+track_width+track_wall_thickness*2+1.25, track_wall_thickness, track_wall_thickness+wheel_rad+6);

translate([0,0,track_wall_thickness+track_wall_height+5.25])
    rotate_extrude(convexity=10)
        translate([track_rad+track_width+track_wall_thickness*2+1.25,0,0])
            circle(r=0.75);

// Build the inside of the plate
difference() {
    for (i = [0:5]) {
        rotate([0,0,i*60]) translate([0,-7,0]) {
            difference() {
                cube([track_rad, 14, track_wall_thickness]);
                for (a = [1/3,4/5]) {
                    for (b = [4,10]) {
                        translate([track_rad*a,b,-0.01]) cylinder(h=track_wall_thickness+1, r=1);
                    }
                }
            }
        }
    }
    translate([0,0,-0.01])
        cylinder(h=track_wall_thickness+0.02, r1=6, r2=5);
}
