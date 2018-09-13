include <common.scad>

// Define all the cuts to form the pieces
module cut_blocks() {
    // Maximum effort
    jigsaw(2,0,2,2);
    jigsaw(2,2,4,2);
    jigsaw(1,1,2,1);
    jigsaw(1,1,1,3);
    jigsaw(0,3,2,3);
    jigsaw(2,3,2,4);
    jigsaw(2,4,3,4);
    jigsaw(3,2,3,6);
    jigsaw(0,4,1,4);
    jigsaw(1,4,1,5);
    jigsaw(1,5,3,5);
}

translate([-base_width-1,0,0])
    difference() {
        base_block();
        cut_grid();
        #cut_blocks();
    }

translate([1,0,0]) tray(base_width, base_length);