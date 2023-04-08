inside_length = 100.4;
inside_width = 62.4;
post_height = 5;
thickness = 2;
post_offset = 2.95;

l = inside_length+thickness*2;
w = inside_width+thickness*2;
t = thickness;

fan_thickness = 8;
fan_side = 30; // square
fan_wire_offset = 5;
fan_wire_width = 3;

module slat() {
    translate([0,0,-0.01]) {
        translate([0,-2, 0]) cube([l-t*2-10, 4, t+0.02]);
        cylinder(h=t+0.02, r=2);
        translate([l-t*2-10, 0, 0]) cylinder(h=t+0.02, r=2);
    }
}
