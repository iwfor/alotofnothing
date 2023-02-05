// Model by Isaac Foraker
//
// Released under Creative Commons Attribution 4.0 International (CC BY 4.0)
// https://creativecommons.org/licenses/by/4.0/

$fn=32;
t = 9;      // Stand minimum thickness
sr = 125;   // Spool radius
rad = sr + 15;
r608 = 11;
st = 117;   // spool thickness
bw = 25;    // base width (bigger for more support)
w = 125; // Width of PSU

module part1() {
    cube([w+t*2, t, t*3]);
    // Make legs
    translate([0,-bw,0]) {
        cube([t,bw,t*3]);
        translate([w+t,0,0]) cube([t,bw,t*3]);
    }
    // Build the stand from the middle out
    translate([w/2+t,t,0]) {
        for (i = [0:1]) mirror([i,0,0]) {
            translate([-w/2-t,0,0]) rotate([0,0,-25]) cube([t, rad+4, t]);
        }
        translate([0,rad,0]) {
            intersection() {
                translate([-r608-t, -r608-t, 0]) cube([(r608+t)*2,r608+t,t]);
                difference() {
                    cylinder(h=t, r=r608+t);
                    translate([0,0,-0.01])
                        cylinder(h=t+0.02,r=r608-1);
                    translate([0,0,0.8])
                        cylinder(h=7.4, r=r608);
                }
            }
        }
    }
}


part1();
