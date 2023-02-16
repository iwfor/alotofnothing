// Model by Isaac Foraker
//
// Released under Creative Commons Attribution 4.0 International (CC BY 4.0)
// https://creativecommons.org/licenses/by/4.0/

$fn = 128;

// Wheel info
wheel_width = 4;
wheel_rad = 5;
wheel_hole_rad = 2;

// Track info
track_wall_thickness = 2;
track_wall_height = 5;
track_width = wheel_width + 0.5; // Need enough room for the wheel to fit in the arc of the circle
track_rad = 70;

// Simple ring creator.  `rad` is the inside radius of the ring.
module ring(rad, thickness, height) {
    rotate_extrude(convexity=10) translate([rad,0,0]) square([thickness,height]);
}
