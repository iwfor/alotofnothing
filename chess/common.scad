// How many faces to render on round objects
faces = 128;

// Base diameter of pieces
base = 24;
small_base = base * 0.8;
big_base = base * 1.25;

// Base height
base_height = 6;

module signature() {
    translate([4.5,-2,-0.5]) mirror([1,0,0]) linear_extrude(0.75) text("IWF", size=4);
}
