// Model by Isaac Foraker
//
// Released under Creative Commons Attribution 4.0 International (CC BY 4.0)
// https://creativecommons.org/licenses/by/4.0/

$fn = 64;
d = 54;
st = 130;   // max spool thickness

difference() {
    cylinder(r=d/2, h=st);
    translate([0,0,-0.01])
        cylinder(r=20.125, h=st+0.02);
}
