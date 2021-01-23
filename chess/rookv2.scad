include <common.scad>
d = soldier_base;
rad = d/2;

module ring(ratio = 1) {
    resize([d*0.75*ratio,d*0.75*ratio,base_height*1.5]) sphere(r=3, $fn=faces);
}

module hat() {
    difference() {
        cylinder(h=base_height*2.5, r=rad*0.56, $fn=faces);
        translate([0,0,base_height]) cylinder(h=base_height*3, r=rad*0.4, $fn = faces);
        translate([-base_height/2,-base_height*2.5,base_height*1.75]) linear_extrude(8) square([base_height,base_height*5]);
        translate([-base_height*2.5,-base_height/2,base_height*1.75]) linear_extrude(8) square([base_height*5,base_height]);
    }
}

module rook() {
    b = 0;
    difference() {
        cylinder(h=base_height*2,r=rad,$fn=faces);
        signature();
        // Draw a ring around the pedestal to carve a curve
        translate([0,0,base_height]) for (i = [0:90]) {
            rotate([0,0,i*4]) translate([rad-0.7,0,base_height+3]) rotate([90,0,0]) cylinder(h=3, r=base_height+3, $fn=32);
        }
    }
    b2 = b + base_height * 2;
    translate([0,0,b2+1]) ring();
    translate([0,0,b2]) difference() {
        cylinder(h=base_height*8, r1=rad*0.5, r2=rad*0.4, $fn=faces);
        translate([0,0,base_height*3+1.25]) for (i = [0:90]) {
            rotate([0,0,i*4]) translate([base_height*12,0,base_height+3]) rotate([90,0,0]) cylinder(h=3, r=base_height*11.125, $fn=64);
        }
    }
    b3 = b2 + base_height*8;
    translate([0,0,b3+2]) ring(0.75);
    translate([0,0,b3+4]) hat();
}

rook();
