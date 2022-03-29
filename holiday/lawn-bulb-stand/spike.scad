$fn=12;
/*
post height 1: 14.25mm
post dia 1: 9.15mm
post dia 1 2/ protrusion: 10.2mm
post height 2: 34mm (rounded at top)
post dia 2: 9mm
base dia: 17.7mm
*/

cylinder(h=34, r=4.5);
translate([0,0,30]) cylinder(h=4,r1=4.5,r2=5.1);
translate([0,0,34]) {
    cylinder(h=14.25, r=5.1);
    translate([0,0,14.25]) {
        resize([17.7,17.7,5]) sphere(r=3);
        intersection() {
            union() {
                translate([-1.2,-5,0]) linear_extrude(120) square([2.4,10]);
                translate([-5,-1.2,0]) linear_extrude(120) square([10,2.4]);
            }
            cylinder(h=120,r1=6,r2=0.5);
        }
    }
}