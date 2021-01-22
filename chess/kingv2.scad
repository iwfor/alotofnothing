include <common.scad>
d = med_base;
rad = d/2;
waste_ratio = 0.6;
col_height = base_height*5;

module ring(ratio = 1) {
    resize([d*0.9*ratio,d*0.9*ratio,base_height*1.5]) sphere(r=3, $fn=faces);
}

module crown() {
    difference() {
        cylinder(h=base_height*2.5, r=rad*0.9, $fn=faces);
        translate([0,0,base_height]) cylinder(h=base_height*3, r=rad*0.8, $fn = faces);
        translate([0,0,base_height*1.75]) {
            for (i = [0,45,90,135])
                rotate([0,0,i]) linear_extrude(8) square([base_height*0.8,base_height*5], center=true);
        }
    }
    translate([0,0,7]) sphere(r=rad*0.8, $fn=faces);
    rotate([0,0,90]) translate([0,0,22]) {
        rotate([0,90,0]) difference() {
            cylinder(h=3,r=5.5, center=true, $fn=faces);
            cylinder(h=4,r=4, center=true, $fn=faces);
        }
        translate([0,0,-5]) linear_extrude(10) square([3,1.5], center=true);
        translate([0,5,0]) rotate([90,0,0]) linear_extrude(10) square([3,1.5], center=true);
    }
}

module king() {
    b = 0;
    // Pedestal
    difference() {
        cylinder(h=base_height,r=rad,$fn=faces);
        signature();
    }
    b1 = b + base_height;
    translate([0,0,b1]) cylinder(h=base_height,r1=rad,r2=rad*0.75,$fn=faces);
    b2 = b1 + base_height;
    translate([0,0,b2]) {
        // Skirt
        translate([0,0,1]) ring();
        translate([0,0,5]) ring();
        // Column
        cylinder(h=col_height, r=rad*waste_ratio, $fn=faces);
    }
    b3 = b2 + col_height;
    // Head
    translate([0,0,b3+2]) ring();
    translate([0,0,b3+4]) crown();
}

king();
