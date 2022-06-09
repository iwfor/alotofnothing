/*
* This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
* http://creativecommons.org/licenses/by-nc-sa/4.0/
*
* Author: Isaac Foraker
*/

module part() {
    color("orange") difference() {
        union() {
            translate([-10, -5, 0]) cube([20, 5, 28]);
            translate([-10, 0, 0])  cube([20, 6.45, 15]);
                rotate([1.5,0,0]) translate([-10, 6.45, -0.5]) cube([20, 5, 40]);

            $fa = 1;
            $fs = 0.4;
            wheel_radius = 12;
            tyre_diameter = 6;
            difference() {
                translate([0, -15, 2.4]) rotate_extrude(angle=360) {
                    translate([15 - 5/2, 0]) circle(d=5);
                }
                translate([-0.625, -15.01, -0.01]) rotate([0,0,50])
                    #cube([1.25, 15.1, 5.1]);
            }
        }
        translate([-10.1, -30, -1]) cube([21,60,1]);
        translate([-10.1,2,-5]) rotate([-30,0,0]) cube([21,8,25]);
    }
}

translate([-16, 0, 0]) part();
translate([16, 0, 0]) mirror([1,0,0]) part();