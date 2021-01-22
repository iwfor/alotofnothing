include <common.scad>
d = base;
rad = d/2;

module ring(ratio = 1) {
    resize([d*0.9*ratio,d*0.9*ratio,base_height*1.5]) sphere(r=3, $fn=faces);
}

module hat() {
    difference() {
        translate([0,0,0]) {
            sphere(r=rad * 0.7, $fn=faces);
            translate([0,0,rad*0.45]) cylinder(h=rad*0.7, r1=rad*0.53, r2=0.9, $fn = faces);
            translate([0,0,rad*1.2]) {
                sphere(r=rad*0.2, $fn = faces);
            }
        }
        translate([rad*0.6,2,0.5]) rotate([25, 25, -75])
            linear_extrude(20) square([1, 3]);
    }
}

b = 0;
difference() {
    cylinder(h=base_height,r=rad,$fn=faces);
    signature();
}
b1 = b + base_height;
translate([0,0,b1]) cylinder(h=base_height,r1=rad,r2=rad*0.75,$fn=faces);
b2 = b1 + base_height;
translate([0,0,b2+1]) ring();
translate([0,0,b2]) cylinder(h=base_height * 4, r1=rad * 0.7, r2 = rad * 0.55, $fn=faces);
b3 = b2 + base_height * 4 + 2;
translate([0,0,b3]) ring(0.8);    
translate([0,0,b3+base_height+3]) {
    hat();
}
