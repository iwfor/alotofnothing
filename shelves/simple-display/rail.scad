// The idea is to make an installable rail that the display shelf will slide onto.

include <parts.scad>

module screw_hole() {
    cylinder(r = 5.5, h = 4.5);
    translate([0,0,4.5-0.01])
        cylinder(r1=3.5,r2=1.75,h=2.5);
    cylinder(r=1.75, h=30);

}


difference() {
    rail();
    translate([width/2,-0.01,0]) {
        translate([0,0,height/4]) rotate([-90,0,0]) screw_hole();
        translate([0,0,height*3/4]) rotate([-90,0,0]) screw_hole();
        translate([-0.125,-0.01,-0.01])
            cube([0.25,4.5,height+2]);
    }
}
