/*
* This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
* http://creativecommons.org/licenses/by-nc-sa/4.0/
*
* Author: Isaac Foraker
*/

$fn = 64;
od = 40.75;
or = od / 2;
id = 38.2;
ir = id / 2;
oh = 7;
ih = 6; // ?

difference() {
    cylinder(h = oh, r = or);
    translate([0,0,oh-ih]) cylinder(h = ih+1, r = ir);
}

od2 = 18.4;
or2 = od2 / 2;
ir2 = or2 - 1.3;

difference() {
    cylinder(h = oh/2, r = or2);
    translate([0,0,oh-ih]) cylinder(h = oh/2+1, r = ir2);
}

difference() {
}

od3 = 8.55;
or3 = od3 / 2;
ir3 = or3 - 1.2;

difference() {
    cylinder(h = oh/2, r = or3);
    translate([0,0,oh-ih]) cylinder(h = oh/2+1, r = ir3);
}
