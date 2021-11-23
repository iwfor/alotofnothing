include <threads.scad>

$fn=64;

// Screw at top of pole
screw_dia_inside    = 15;   // 15mm
screw_dia_outside   = 18.5; // 18.5mm
screw_height        = 18;   // 18mm-ish
// Base, under screw
base_height         = 50;   // 75mm / ~3in
base_dia1           = 30;
base_dia2           = 23;

pole_dia            = 21;

module dome() {
    difference() {
        intersection() {
            r = screw_dia_outside/2+2;
            sphere(r=r);
            translate([-r,-r,0]) linear_extrude(r) square([r*2,r*2]);
        }
        sphere(r=screw_dia_outside/2);
    }
}

module solid1() {
    translate([0,0,-25]) {
        difference() {
            cylinder(h=25, r=base_dia1/2);
            translate([0,0,-1]) cylinder(h=27, r=pole_dia/2);
        }
    }
    difference() {
        cylinder(h=base_height, r1=base_dia1/2, r2=base_dia2/2);
        sphere(r=pole_dia/2);
    }
    translate([0,0,base_height]) {
        cylinder(h=screw_height, r=screw_dia_inside/2);
        metric_thread(diameter=screw_dia_outside, pitch=5, thread_size=3, groove=true, length=screw_height);
    }
}

difference() {
    solid1();
    translate([0,0,-26]) cylinder(h=25+base_height+screw_height+2, r=3.25);
    translate([0,0,base_height+screw_height-4]) dome();
}
