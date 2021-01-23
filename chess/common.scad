// How many faces to render on round objects
faces = 128;

// Base diameter of pieces
base = 24;
small_base = base * 0.8;
med_base = base * 1.1;
big_base = base * 1.25;

square_width = 60;
king_base = 45;
soldier_base = 40;
pawn_base = 35;

// Base height
base_height = 6;

module signature() {
    translate([6,-2,-0.4]) mirror([1,0,0]) linear_extrude(1) text("IWF", size=5);
}

module chess_square() {
    bh = base_height;
    hh = bh / 2;
    difference() {
        linear_extrude(bh) square(square_width);
        translate([0,0,hh]) {
            translate([-1,-1,0]) linear_extrude(hh+1) square([hh+1,square_width+2]);
            translate([-1,-1,0]) linear_extrude(hh+1) square([square_width+2,hh+1]);
            translate([square_width-hh,-1,0]) linear_extrude(hh+1) square([hh+1,square_width+2]);
            translate([-1,square_width-hh,0]) linear_extrude(hh+1) square([square_width+2,hh+1]);
        }
    }
}
