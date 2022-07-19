include <MCAD/2Dshapes.scad>

$fn=32;
t = 2.5;
h = 10;
cube([t,10,h]);
translate([t/2,10,0]) cylinder(r=t/2,h=h);
translate([t,t+5,h/2]) {
    rotate([0,90,0]) cylinder(r1=1.5,r2=0.9,h=0.75);
    translate([0.5,0,0]) sphere(r=0.9);
}
translate([t,0,0]) cube([3.6,t,h]);
translate([t+3.6,0,0]) {
    difference() {
        union() {
            cube([t,t+5,h]);
            translate([0,t+5,0])
                linear_extrude(h) donutSlice(0,t+0.75, 270,430);
        }
        translate([-0.01,t+5,-0.01]) {
            translate([0,-0.75,0]) cube([0.75,1.5,h+1]);
            translate([0.75,0,0]) cylinder(r=0.75,h=h+1);
        }
        translate([0,5+t*2,-0.01]) cube([20,2,h+1]);
    }
}