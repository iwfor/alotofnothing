// Model by Isaac Foraker
//
// Released under Creative Commons Attribution 4.0 International (CC BY 4.0)
// https://creativecommons.org/licenses/by/4.0/

include <common.scad>

ring(track_rad, track_width+track_wall_thickness*2, track_wall_thickness);
ring(track_rad, track_wall_thickness, track_wall_thickness+wheel_rad/2);
ring(track_rad+track_width+track_wall_thickness, track_wall_thickness, track_wall_thickness+wheel_rad+1);

translate([0,0,track_wall_thickness+track_wall_height])
    rotate_extrude(convexity=10)
        translate([track_rad+track_width+track_wall_thickness*2,0,0])
            circle(r=1);