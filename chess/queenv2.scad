include <common.scad>
d = med_base;
rad = d/2;
waste_ratio = 0.40;
col_height = base_height*5.5;

module ring(ratio = 1) {
    resize([d*0.9*ratio,d*0.9*ratio,base_height*1.5]) sphere(r=3, $fn=faces);
}

module crown() {
    difference() {
        cylinder(h=base_height*2.5, r=rad*0.9, $fn=faces);
        translate([0,0,base_height]) cylinder(h=base_height*3, r=rad*0.8, $fn = faces);
        translate([rad,0,rad+6-0.25]) sphere(r=rad*0.8);
        translate([-rad,0,rad+6-0.25]) sphere(r=rad*0.8);
        translate([0,rad,rad+6-0.25]) sphere(r=rad*0.8);
        translate([0,-rad,rad+6-0.25]) sphere(r=rad*0.8);
    }
    translate([0,0,5]) sphere(r=rad*0.8, $fn=faces);
    translate([0,0,16]) sphere(r=rad*0.2, $fn=faces);
}

module queen() {
    b = 0;
    // Pedastal
    difference() {
        cylinder(h=base_height,r=rad,$fn=faces);
        signature();
    }
    b1 = b + base_height;
    translate([0,0,b1]) cylinder(h=base_height,r1=rad,r2=rad*0.75,$fn=faces);
    b2 = b1 + base_height;
    translate([0,0,b2]) {
        // skirt
        translate([0,0,0]) ring();
        translate([0,0,4]) ring();
        // column
        fifth = col_height/5;
        translate([0,0,fifth]) cylinder(h=fifth, r1=rad*0.6, r2=rad*waste_ratio*1.1, $fn=faces);
        
        translate([0,0,fifth*2]) cylinder(h=fifth, r1=rad*waste_ratio*1.1, r2=rad*waste_ratio, $fn=faces);
        translate([0,0,fifth*3]) cylinder(h=fifth, r1=rad*waste_ratio, r2=rad*waste_ratio*1.1, $fn=faces);
        
        translate([0,0,fifth*4]) cylinder(h=fifth*1.5, r1=rad*waste_ratio*1.1, r2 = rad*0.75, $fn=faces);
//        translate([0,0,base_height*4]) cylinder(h=base_height*2-1, r1=rad*waste_ratio, r2=rad*0.5, $fn=faces);
    }
    b3 = b2 + base_height*6;
    // Head
    translate([0,0,b3+1]) ring();
    translate([0,0,b3+3]) crown();
}

queen();