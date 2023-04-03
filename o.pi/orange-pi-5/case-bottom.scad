// 100mm x 62mm x 5mm (inside)

$fn=32;

inside_length = 100;
inside_width = 62;
post_height = 5;
thickness = 2;

l = inside_length+thickness*2;
w = inside_width+thickness*2;
t = thickness;

module slat() {
    translate([0,0,-0.01]) {
        translate([0,-2, 0]) cube([l-t*2-10, 4, t+0.02]);
        cylinder(h=t+0.02, r=2);
        translate([l-t*2-10, 0, 0]) cylinder(h=t+0.02, r=2);
    }
}

module base() {
    difference() {
        cube([l, w, t]);
        for (i = [1:8]) {
            translate([t+5, 6.85*i+t, 0]) slat();
        }
    }
    translate([t+2.5,t+2.5,t]) post();
    translate([l-t-2.5,t+2.5,t]) post();
    translate([t+2.5,w-t-2.5,t]) post();
    translate([l-t-2.5,w-t-2.5,t]) post();
    translate([0,0,t]) {
        difference() {
            cube([l,t,post_height+1]);
            translate([61,-0.01,t+post_height-2.5])
                cube([20,t+0.02,3]);
        }
        cube([t,w,post_height+1]);
        translate([0,w-t,0]) cube([l,t,post_height+1]);
        translate([l-t,0,0]) cube([t,w,post_height+1]);
    }
}

module post() {
    cylinder(h=post_height, r=2.5);
    cylinder(h=post_height+3, r=1.25);
    translate([0,0,post_height+3]) sphere(r=1.25);
}

base();
