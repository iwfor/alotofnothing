include <common.scad>
d = pawn_base;
rad = d/2;

module pawn() {
    b = 0;
    difference() {
        cylinder(h=base_height*2,r=rad,$fn=64);
        signature();
        // Draw a ring around the pedestal to carve a curve
        translate([0,0,base_height]) for (i = [0:90]) {
            rotate([0,0,i*4]) translate([rad-0.7,0,base_height+3]) rotate([90,0,0]) cylinder(h=3, r=base_height+3, $fn=32);
        }
    }

    b1 = b + base_height*2 + 1;
    translate([0,0,b1]) resize([d*0.7,d*0.7,base_height]) 
        sphere(r=3, $fn=64);
    translate([0,0,b1]) difference() {
        cylinder(h=base_height*6, r1=rad*0.5, r2=rad*0.35, $fn=64);
        translate([0,0,base_height*2+2.25]) for (i = [0:90]) {
rotate([0,0,i*4]) translate([base_height*12,0,base_height+3]) rotate([90,0,0]) cylinder(h=3, r=base_height*11.15, $fn=64);
        }
    }
    b2 = b1 + base_height*5.5+4;
    translate([0,0,b2]) resize([d*0.5,d*0.5,base_height]) 
        sphere(r=3, $fn=64);
    b3 = b2 + base_height;
    translate([0,0,b3+4]) sphere(r=rad*0.6, $fn=64);
}

pawn();