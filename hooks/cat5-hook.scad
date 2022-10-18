
$fn = 64;
d = 6; // Diameter of CAT5/6 cable
h = 10;
t = 2.4;
l  = 25;

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
            cube([d/2+1.5, l, h+1]);
    }
    translate([-d/2-0.6, d/2+5, 2])
        cube([3, 15, h-4]);
    translate([-d/2-t-0.1, d/2+5, 2])
        cube([3, 5, h-4]);
    translate([-d/2-t-0.1, d/2+15, 2])
        cube([3, 5, h-4]);
}

translate([1.7, d/2+1.2, 0])
    cylinder(h=h, r=1.6);
