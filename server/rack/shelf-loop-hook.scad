// Make a clip to allow supporting a shelf with string or fishing line.

$fn=32;
t = 3;
h = 8;
l = 5;
lip_h = 9; // height of lip
gap = 2; // Looks like 2mm thick metal
o = t*2+lip_h+3;


difference() {
    union() {
        cube([o, t, h]);
        translate([o, 0, h/2])
            rotate([-90,0,0]) cylinder(h=t, r=h/2);
    }
    translate([o, -0.01, h/2])
        rotate([-90,0,0]) cylinder(h=t+0.1, r=1.5);
}
    
translate([0, t, 0]) {
    cube([t, t+gap, h]);
    translate([t, gap+t/2, 0])
        cylinder(h=h, r=t/2);
    translate([t+lip_h, 0, 0]) cube([t, 6, h]);
}
