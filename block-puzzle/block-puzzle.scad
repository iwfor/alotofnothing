include <common.scad>


module cut_blocks() {
    // Maximum effort
    jigsaw(1,0,1,1);
    jigsaw(1,1,2,1);
    jigsaw(2,1,2,5);
    jigsaw(1,3,2,3);
    jigsaw(1,2,1,6);
    jigsaw(0,2,1,2);
    jigsaw(2,5,3,5);
    jigsaw(3,5,3,6);
    jigsaw(2,4,3,4);
    jigsaw(3,3,3,4);
    jigsaw(3,3,4,3);
    jigsaw(3,1,3,2);
    jigsaw(2,2,3,2);
    jigsaw(3,1,4,1);
}

translate([-base_width-1,0,0])
    difference() {
        base_block();
        cut_grid();
        #cut_blocks();
    }

difference() {
    translate([1,0,0]) tray(base_width, base_length);
    sign();
}