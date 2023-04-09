/*
* This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
* http://creativecommons.org/licenses/by-nc-sa/4.0/
*
* Author: Isaac Foraker
*/

// A simple riser to install an M.2 2242 NVMe drive

$fn=32;

opening = 3.2;          // Hole in board
board_depth = 1.4;      // How thick is the board?
riser_height = 1;       // How tall should the riser be?
nvme_thickness = 1.5;   // How thick is the NVMe drive?

height = board_depth + riser_height + nvme_thickness + 2;

module part1() {
    difference() {
        union() {
            // Draw board clip
            resize([3.6,3.6,2.8]) sphere(r=3);
            // Draw main post
            translate([0,0,0.65]) cylinder(h = height, r = opening/2);
        }
        // Cut a slot in the post to allow it to flex through the board
        translate([-0.5,-2,-1.5]) cube([1,4,4]);
    }
    translate([0,0,0.65]) {
        // Board rest
        translate([0, 0, board_depth]) cylinder(h=riser_height, r=3.5);
    }
    translate([0,0,0.65+height-2]) {
        // NVMe drive clip
        intersection() {
            cylinder(h=2,r=3.5);
            translate([-opening/2,-8,0]) cube([opening, 8, 2]);
        }
    }
}

// Now turn the model on its side, slightly sunken beneath the plain, and wrap it in a bounding box to flatten the bottom so it can print without supports.
intersection() {
    translate([0,-1,1.25]) rotate([-90,0,0]) {
        part1();
    }
    translate([-4,-3,0]) cube([8,10,6]);
}
