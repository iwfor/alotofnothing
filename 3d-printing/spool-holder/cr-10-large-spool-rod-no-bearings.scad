// Model by Isaac Foraker
//
// Released under Creative Commons Attribution 4.0 International (CC BY 4.0)
// https://creativecommons.org/licenses/by/4.0/

$fn=64;
r608 = 11;
t608 = 7;
o608 = 8;
st = 130;   // max spool thickness

cylinder(h=t608, r=r608);
translate([0,0,st+r608]) cylinder(h=t608, r=r608);
translate([0,0,t608])
    cylinder(h=st+4, r=r608-1);
translate([0,0,t608+2]) {
    cylinder(h=st, r=20);
    // Make a thin disc to prevent spool sliding off this end.
    cylinder(h=1.2, r=30);
}