include <common.scad>
d = king_base;
rad = d/2;
waste_ratio = 0.35;
col_height = base_height*7.6;

module ring(ratio = 1) {
    resize([d*0.7*ratio,d*0.7*ratio,base_height*1.5]) sphere(r=3, $fn=faces);
}

module crown() {
    cr = rad*0.6;
    difference() {
        cylinder(h=base_height*2.5, r=cr*0.9, $fn=faces);
        translate([0,0,base_height]) cylinder(h=base_height*3, r=cr*0.8, $fn = faces);
        translate([0,0,base_height*1.75]) {
            for (i = [0,45,90,135])
                rotate([0,0,i]) linear_extrude(6) square([base_height*0.8,king_base], center=true);
        }
    }
    translate([0,0,7]) sphere(r=cr*0.8, $fn=faces);
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
    translate([0,0,b1]) difference() {
        cylinder(h=base_height,r1=rad,r2=rad*0.6,$fn=faces);
        // Draw a ring around the pedestal to carve a curve
        for (i = [0:90]) {
            rotate([0,0,i*4]) translate([rad-0.7,0,base_height+3]) rotate([90,0,0]) cylinder(h=3, r=base_height+3, $fn=32);
        }
    }
    b2 = b1 + base_height;
    translate([0,0,b2]) {
        // Skirt
        translate([0,0,3]) ring(1.1);
        translate([0,0,10]) ring(0.9);
        // Column
        cylinder(h=col_height, r=rad*waste_ratio, $fn=faces);
    }
    b3 = b2 + col_height;
    // Head
    translate([0,0,b3+2]) ring(0.75);
    translate([0,0,b3+4]) cylinder(h=1,r1=rad*0.45,r2=rad*0.53,$fn=faces);
    translate([0,0,b3+5]) crown();
}

king();