height = 137.5;
outside_r = 17.5/2;
opening_r = 10.2/2;

/*
top rod height 1: 25.5mm
top rod dia 1: 9.15mm
top rod dia 1: w/ protrusion: 9.62mm
top rod height 2: 23.4mm (rounded no top)
top rod dia 2: 8.3mm
*/

difference() {
    cylinder(h=height, r=outside_r);
#    translate([0,0,-1]) cylinder(h=height-10, r=opening_r);
}

translate([0,0,height]) {
    cylinder(h=25.5, r=4.575);
    translate([0,0,25.5]) {
        cylinder(h=5,r1=4.575,r2=4.15);
        cylinder(h=23.4-4.15, r=4.15);
        #translate([0,0,23.4-4.15]) sphere(r=4.15);
    }
}
