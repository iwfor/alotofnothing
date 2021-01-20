include <common.scad>
d = base;
rad = d/2;

module ring(ratio = 1) {
    resize([d*0.9*ratio,d*0.9*ratio,base_height*1.5]) sphere(r=3, $fn=faces);
}

module ear() {
    rotate([-25,15,0]) {
        difference() {
            translate([0,0,0]) {
                cylinder(h=rad*0.75,r1=rad*0.25,r2=0.5,$fn=faces);
            }
            translate([0,-3,-1]) rotate([0,0,-15]) linear_extrude(rad) square([3,6]);
        }
    }
}

module nostril() {
    rotate([15,0,0]) resize([3,3,2]) sphere(r=3, $fn=faces);
}

module eye() {
    rotate([15,30,-15]) resize([4,6,3]) sphere(r=3, $fn=faces);
}

module head() {
    rotate([-20,0,0]) difference() {
        translate([0,0,0]) {
            sphere(r=rad * 0.75, $fn=faces);
            // Snout
            translate([0,-rad*0.27,0]) {
                rotate([90,0,0]) cylinder(h=rad*1.5, r1=rad*0.7, r2=rad*0.39, $fn = 6);
            }
            translate([rad*0.4,rad*0.15,rad*0.5])
                ear();
            translate([-rad*0.4,rad*0.15,rad*0.5])
                mirror([1,0,0]) ear();
            translate([rad*0.4,-rad*0.45,rad*0.45]) eye();
            translate([-rad*0.4,-rad*0.45,rad*0.45]) mirror([1,0,0]) eye();
            // Mane
            translate([0,2,rad*0.25]) resize([d*0.35,d,d], $fn=faces) sphere(3);
        }
        translate([4,-rad*1.7,2]) nostril();
        translate([-4,-rad*1.7,2]) nostril();
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
translate([0,0,b2]) cylinder(h=base_height * 4, r1=rad * 0.75, r2 = rad * 0.6, $fn=faces);
b3 = b2 + base_height * 4 + 2;
translate([0,0,b3]) ring(0.85);    
translate([0,0,b3+base_height+3]) {
    head();
}
