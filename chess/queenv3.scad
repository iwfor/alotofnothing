include <common.scad>
d = king_base;
rad = d/2;
waste_ratio = 0.27;
col_height = base_height*7.75;

module ring(ratio = 1) {
    resize([d*0.7*ratio,d*0.7*ratio,base_height*1.5]) sphere(r=3, $fn=faces);
}

module crown() {
    cr = rad * 0.5;
    difference() {
        cylinder(h=base_height*2.5, r=cr, $fn=faces);
        translate([0,0,base_height]) cylinder(h=base_height*3, r=cr*0.9, $fn = faces);
        translate([cr,0,cr+6-0.25]) sphere(r=cr*0.85);
        translate([-cr,0,cr+6-0.25]) sphere(r=cr*0.85);
        translate([0,cr,cr+6-0.25]) sphere(r=cr*0.85);
        translate([0,-cr,cr+6-0.25]) sphere(r=cr*0.85);
    }
    translate([0,0,5]) sphere(r=cr*0.91, $fn=faces);
    translate([0,0,16]) sphere(r=cr*0.2, $fn=faces);
}

module queen() {
    b = 0;
    // Pedestal
    difference() {
        cylinder(h=base_height,r=rad,$fn=faces);
        signature();
    }
    b1 = b + base_height;
    translate([0,0,b1]) difference() {
        cylinder(h=base_height,r1=rad,r2=rad*0.6,$fn=faces);
        // Draw a ring around the pedestal to carve a curve
        for (i = [0:90]) {
            rotate([0,0,i*4]) translate([rad-0.7,0,base_height+3]) rotate([90,0,0]) cylinder(h=3, r=base_height+3, $fn=32);
        }
    }
    b2 = b1 + base_height;
    translate([0,0,b2]) {
        // skirt
        translate([0,0,3]) ring(1.1);
        translate([0,0,10]) ring(0.9);        // column
        fifth = col_height/5;
        translate([0,0,fifth]) cylinder(h=fifth, r1=rad*0.5, r2=rad*waste_ratio*1.1, $fn=faces);
        
        translate([0,0,fifth*2]) cylinder(h=fifth, r1=rad*waste_ratio*1.1, r2=rad*waste_ratio, $fn=faces);
        translate([0,0,fifth*3]) cylinder(h=fifth, r1=rad*waste_ratio, r2=rad*waste_ratio*1.1, $fn=faces);
        
        translate([0,0,fifth*4]) cylinder(h=fifth*1.5, r1=rad*waste_ratio*1.1, r2 = rad*0.425, $fn=faces);
    }
    b3 = b2 + base_height*8.75;
    // Head
    translate([0,0,b3+1]) ring(0.85);
    translate([0,0,b3+3]) crown();
}

queen();