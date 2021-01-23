include <common.scad>
d = soldier_base;
rad = d/2;

module ring(ratio = 1) {
    resize([d*0.75*ratio,d*0.75*ratio,base_height*1.5]) sphere(r=3, $fn=faces);
}

module hat() {
    hr = rad * 0.6;
    difference() {
        translate([0,0,0]) {
            sphere(r=hr * 0.7, $fn=faces);
            translate([0,0,hr*0.45]) cylinder(h=hr*0.8, r1=hr*0.53, r2=0.9, $fn = faces);
            translate([0,0,hr*1.25]) {
                sphere(r=hr*0.15, $fn = faces);
            }
        }
        translate([hr*0.6,2,-1]) rotate([25, 25, -75])
            linear_extrude(20) square([1, 3]);
    }
}

module bishop() {
    b = 0;
    difference() {
        cylinder(h=base_height*2,r=rad,$fn=faces);
        signature();
        // Draw a ring around the pedestal to carve a curve
        translate([0,0,base_height]) for (i = [0:90]) {
            rotate([0,0,i*4]) translate([rad-0.7,0,base_height+3]) rotate([90,0,0]) cylinder(h=3, r=base_height+3, $fn=32);
        }
    }
    b2 = b + base_height*2;
    translate([0,0,b2+1]) ring();
    translate([0,0,b2]) difference() {
        cylinder(h=base_height*7, r1=rad*0.5, r2=rad*0.4, $fn=faces);
        translate([0,0,base_height*3+1.25]) for (i = [0:90]) {
            rotate([0,0,i*4]) translate([base_height*12,0,base_height+3]) rotate([90,0,0]) cylinder(h=3, r=base_height*11.125, $fn=64);
        }
    }
    b3 = b2 + base_height*7;
    translate([0,0,b3+2]) ring(0.6);
    translate([0,0,b3+base_height+3]) {
        hat();
    }
}

bishop();
