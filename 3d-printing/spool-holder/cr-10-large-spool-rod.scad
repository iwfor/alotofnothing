// Model by Isaac Foraker
//
// Released under Creative Commons Attribution 4.0 International (CC BY 4.0)
// https://creativecommons.org/licenses/by/4.0/

$fn=64;
r608 = 11;
t608 = 7 + 6.5;
o608 = 8;
st = 130;   // max spool thickness

difference() {
    cylinder(h=st+t608*2+4, r=o608/2);
    translate([-5, 0, 3.25]) rotate([0,90,0]) cylinder(h=10, r=1.65);
    translate([-5, 0, st+t608*2+4-3.25]) rotate([0,90,0]) cylinder(h=10, r=1.65);
}
translate([0,0,t608])
    cylinder(h=st+4, r=o608/2+2);
translate([0,0,t608+2]) {
    cylinder(h=st, r=20);
    // Make a thin disc to prevent spool sliding off this end.
    cylinder(h=1.2, r=30);
}