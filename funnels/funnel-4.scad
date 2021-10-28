// Funnel
// Base: 4cm
// Top: 120cm
include <MCAD/2Dshapes.scad>

$fn=180;
top = 140;
bottom = 40;
h = 100;
t = 3;
mouth = 20;

difference() {
    cylinder(r1=top/2+t,r2=bottom/2+t,h=h-mouth);
    translate([0,0,-0.01]) cylinder(r1=top/2,r2=bottom/2,h=h-mouth+0.02);
}
translate([0,0,h-mouth]) difference() {
    translate([0,0,0]) {
        cylinder(r=bottom/2+t,h=mouth);
        translate([0,0,mouth-0.8]) resize([bottom+t*2+3,bottom+t*2+3,5]) sphere(r=bottom/2+t+1.5);
    }
    translate([0,0,-0.01]) cylinder(r=bottom/2,h+0.02);
}
translate([53,5,30]) rotate([90,58,0]) linear_extrude(10) donutSlice(20,30,0,180);
