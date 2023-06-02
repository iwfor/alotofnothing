// Designed by Isaac W. Foraker
//
// Released under Creative Commons Attribution 4.0 license
// https://creativecommons.org/licenses/by/4.0/

$fn=64;
nut = 10; //mm
cap = 22; //mm


difference() {
    union() {
        cylinder(r=cap/2, h=3);
        translate([0,0,3]) {
            difference() {
                sphere(cap/2);
                translate([-cap/2,-cap/2,-cap/2-0.01]) {
                    cube([cap,cap,cap/2+0.01]);
                }
            }
        }
    }
    translate([0,0,-0.01]) {
        cylinder(r=11.5/2, h=7, $fn=6);
    }
}
