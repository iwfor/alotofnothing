include <MCAD/2Dshapes.scad>

$fn=64;

// Count of notches around the perimeter of the insert
notches = 20;
height = 4.25;
bheight = 1.95;
theight = 2.3;
outsidedia = 28.6;
centerdia = 7.75;
ringdia = 18.75;
ringthicknessbottom = 1.55;
ringthicknessmiddle = 1.25;
ringthicknesstop = 0.95;

module sprinkler_insert(opening) {
    difference() {
        translate([0,0,0]) {
            cylinder(h=bheight, r=outsidedia/2);
            cylinder(h=height, r=ringdia/2);
        }
        translate([0,0,-0.01]) cylinder(h=height+0.02, r1=ringdia/2-ringthicknessbottom, r2=ringdia/2-ringthicknesstop);
        // Cut notches around the part
        for (i = [0:19]) {
            rotate([0,0,i*(360/notches)+360/(notches*2)]) translate([outsidedia/2-0.75,0,-0.01]) {
                translate([0,-1,0]) linear_extrude(2) square([2,2]);
                cylinder(h=2,r=1);
            }
        }
    }
    // Add the flow control part in the middle of the insert
    linear_extrude(bheight) donutSlice(centerdia/2,ringdia/2,0,360-opening+10);
}
