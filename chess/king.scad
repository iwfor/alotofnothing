include <common.scad>
d = big_base;
rad = d/2;
waste_ratio = 0.9;

module ring(ratio = 1) {
    resize([d*0.9*ratio,d*0.9*ratio,base_height*1.5]) sphere(r=3, $fn=faces);
}

module crown() {
    difference() {
        cylinder(h=base_height*2.5, r=rad*0.9, $fn=faces);
        translate([0,0,base_height]) cylinder(h=base_height*3, r=rad*0.8, $fn = faces);
        translate([-base_height/2,-base_height*2.5,base_height*1.75]) linear_extrude(8) square([base_height,base_height*5]);
        translate([-base_height*2.5,-base_height/2,base_height*1.75]) linear_extrude(8) square([base_height*5,base_height]);
    }
    translate([0,0,7]) sphere(r=rad*0.8, $fn=faces);
    translate([0,0,20]) sphere(r=rad*0.2, $fn=faces);
}

module king() {
    b = 0;
    // Pedastal
    difference() {
        cylinder(h=base_height,r=rad,$fn=faces);
        signature();
    }
    b1 = b + base_height;
    translate([0,0,b1]) cylinder(h=base_height,r1=rad,r2=rad*0.75,$fn=faces);
    b2 = b1 + base_height;
    // Column
    translate([0,0,b2+1]) ring();
    translate([0,0,b2]) cylinder(h=base_height*4, r1=rad*0.7, r2=rad*waste_ratio, $fn=faces);
    translate([0,0,b2+base_height*4]) cylinder(h=base_height, r=rad*waste_ratio, $fn=faces);
    translate([0,0,b2+base_height*5]) cylinder(h=base_height*3, r1=rad*waste_ratio, r2=rad*0.7, $fn=faces);
    b3 = b2 + base_height*7;
    // Head
    translate([0,0,b3+2]) ring();
    translate([0,0,b3+4]) crown();
}

king();