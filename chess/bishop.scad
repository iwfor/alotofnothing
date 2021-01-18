// Faces
faces = 64;

translate([0,0,0]) cylinder(h=2,r=6,$fn=faces);
translate([0,0,2]) cylinder(h=2,r1=6,r2=3.5,$fn=faces);
translate([0,0,5]) resize([9,9,5]) sphere(r=3, $fn=faces);
translate([0,0,4]) cylinder(h=14, r=3, $fn=faces);
translate([0,0,17]) resize([9,9,3]) sphere(r=3, $fn=faces);    
translate([0,0,20]) {
    difference() {
        translate() {
            sphere(r=4.5, $fn=faces);
            translate([0,0,1.85]) cylinder(h=6.5, r1=4.1, r2=1, $fn = faces);
            translate([0,0,9]) {
                sphere(r=2, $fn = faces);
            }
        }
        translate([3,1,0.5]) rotate([25, 25, -75]) linear_extrude(20) square([1, 2]);
}}
