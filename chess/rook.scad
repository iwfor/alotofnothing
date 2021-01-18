// Faces
faces = 64;

translate([0,0,0]) cylinder(h=2,r=6,$fn=faces);
translate([0,0,2]) cylinder(h=2,r1=6,r2=3.5,$fn=faces);
translate([0,0,5]) resize([9,9,5]) sphere(r=3, $fn=faces);
translate([0,0,4]) cylinder(h=14, r=3, $fn=faces);
translate([0,0,18]) difference() {
    cylinder(h=5, r=4.5, $fn=faces);
    translate([0,0,1.75]) cylinder(h=6, r=2.9, $fn = faces);
    translate([-1.25,-8,3.25]) linear_extrude(3) square([2.5,16]);
    translate([-8,-1.25,3.25]) linear_extrude(3) square([16,2.5]);
}