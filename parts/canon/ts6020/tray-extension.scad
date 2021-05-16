// Designed by Isaac W. Foraker
//
// Released under Creative Commons Attribution 4.0 license
// https://creativecommons.org/licenses/by/4.0/

include <MCAD/2Dshapes.scad>

// Set number of faces on circles, cylinders, etc.
$fn = 32;
// Diameter of the pins that hold this part in place
pin_dia = 3.75;
pin_hole_rad = (pin_dia+0.25)/2;

// Start with the basic shape, then sculpt out the bits we don't want.
difference() {
    // The basic tray
    rotate([0,90,0]) linear_extrude(41) polygon([
        [0,0],
        [-10.25,5],
        [-3,120],
        [0,120]
    ]);
    linear_extrude(11) {
        // Cut away 5mm from either side facing the printer
        translate([-0.01,-0.01,-0.1]) square([6,9]);
        translate([41-5.99,-0.01,-0.1]) square([6,9]);
        // Cut slits behind the holes that connect to the tray to make the part more flexible.
        translate([4.5,8.99,-0.01]) square([1.5,20]);
        translate([41-6,8.99,-0.01]) square([1.5,20]);
    }
    // Place the pin holes on the sides
    // Pin starts 13mm from inside, and is 3.75mm in diameter
    translate([-0.1,13+pin_hole_rad,5.1]) rotate([0,90,0]) cylinder(h=5.2,r=pin_hole_rad);
    translate([41.1,13+pin_hole_rad,5.1]) rotate([0,-90,0]) cylinder(h=5.2,r=pin_hole_rad);
    // Now round up some of the corners for aesthetics.
    // round pin connectors
    translate([-0.1,14,5.1]) rotate([0,90,0]) linear_extrude(5.2) donutSlice(5.1,10,180,360);
    translate([41.1,14,5.1]) rotate([0,-90,0]) linear_extrude(5.2) donutSlice(5.1,10,180,360);
    // round front corners
    translate([5,115,-0.1]) linear_extrude(5) donutSlice(5,10,90,180);
    translate([36,115,-0.1]) linear_extrude(5) donutSlice(5,10,0,90);
    // Round bottom leading edge
    translate([-0.1,117,3]) rotate([0,90,0]) linear_extrude(42) donutSlice(3,5,0,90);
    // Rount bottom back
    translate([-0.1,2,2]) rotate([0,90,0]) linear_extrude(42) donutSlice(2,5,270,360);
    
    // Carve some grooves in the bottom to help make releasing the model from the print bed easier
    for (x = [12,20.5,29]) {
        translate([x,6,-2.5]) rotate([-90,0,0]) cylinder(h=107, r=4);
    }
    
    // Add impression on top, mostly for looks
    translate([20.5,60,8.5]) rotate([-4,0,0]) resize([30,100,8]) sphere(r=3);
}
