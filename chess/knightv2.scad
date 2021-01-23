include <common.scad>
d = soldier_base;
rad = d/2;
hr = rad * 0.65;

module ring(ratio = 1) {
    resize([d*0.75*ratio,d*0.75*ratio,base_height*1.5]) sphere(r=3, $fn=faces);
}

module ear() {
    rotate([-28,15,0]) {
        difference() {
            translate([0,0,0]) {
                cylinder(h=hr*0.75,r1=hr*0.25,r2=0.5,$fn=faces);
            }
            translate([0,-3,-1]) rotate([0,0,-15]) linear_extrude(rad) square([3,6]);
        }
    }
}

module nostril() {
    rotate([15,0,0]) resize([2.25,2.25,1.5]) sphere(r=3, $fn=faces);
}

module eye() {
    rotate([15,30,-15]) resize([5,7,3.5]) sphere(r=3, $fn=faces);
}

module head() {
    rotate([-20,0,0]) difference() {
        translate([0,0,0]) {
//            sphere(r=hr * 0.75, $fn=faces);
            resize([hr*1.5, hr*1.8, hr*1.5]) sphere(3, $fn=faces);
            // Snout
            translate([0,-rad*0.27,0]) {
                rotate([90,0,0]) cylinder(h=hr*1.3, r1=hr*0.69, r2=hr*0.38, $fn = 6);
            }
            // Ears
            translate([hr*0.4,hr*0.15,hr*0.5])
                ear();
            translate([-hr*0.4,hr*0.15,hr*0.5])
                mirror([1,0,0]) ear();
            // Eyes
            for (i = [1, -1]) {
                translate([-1*i*hr*0.35,-hr*0.45,hr*0.45]) eye();
            }
            // Mane
            translate([0,5,hr*0.2]) resize([hr*0.75,hr*1.75,hr*1.75], $fn=faces) sphere(3);
        }
        // Nostrils
        for (i = [1, -1]) {
            translate([-1*i*3.7,-hr*1.65,2]) nostril();
        }
    }
}

module knight() {
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
        cylinder(h=base_height*7.5, r1=rad*0.5, r2=rad*0.4, $fn=faces);
        translate([0,0,base_height*3+1.25]) for (i = [0:90]) {
            rotate([0,0,i*4]) translate([base_height*12,0,base_height+3]) rotate([90,0,0]) cylinder(h=3, r=base_height*11.125, $fn=64);
        }
    }
    b3 = b2 + base_height*7.5;
    translate([0,0,b3+2]) ring(0.65);
    translate([0,0,b3+base_height+3]) head();
}

knight();
