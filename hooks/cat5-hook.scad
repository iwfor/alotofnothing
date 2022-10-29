
$fn = 64;
d = 6.5; // Diameter of CAT5/6 cable
h = 10;
t = 3.2;
l  = 38;

module shape1() {
    cylinder(h=h, r=d/2+t);
    translate([-d/2-t, 0, 0])
        cube([t, l, h]);
}


difference() {
    shape1();
    translate([0,0,-0.1]) {
        cylinder(h=h+1, r=d/2);
        translate([-d/2,0,0])
            cube([d/2+2, l, h+1]);
    }
    offset = 18;
    translate([-d/2-0.6, d/2+offset, 2])
        cube([3, 15, h-4]);
    translate([-d/2-t-0.1, d/2+offset, 2])
        cube([3, 5, h-4]);
    translate([-d/2-t-0.1, d/2+offset+10, 2])
        cube([3, 5, h-4]);
}

translate([2.65, d/2+1.2, 0])
    cylinder(h=h, r=2);
