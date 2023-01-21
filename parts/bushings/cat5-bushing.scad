$fn=64;

difference() {
    union() {
        cylinder(h=4, r1=10, r2=15);
        translate([0,0,4]) cylinder(h=1.2, r=15);
        translate([0,0,5]) cylinder(h=30, r=5.4);
        translate([0,0,35]) cylinder(h=3, r1=5.4, r2=3.6);
    }
    translate([0,0,-0.01]) cylinder(h=100, r=3);
    translate([0,0,-0.01]) cylinder(h=2, r1=5, r2=3);
}

// Add ridges
for (z = [12,20,28]) {
    translate([0,0,z]) resize([11.5,11.5,3.6])
        rotate_extrude()
            translate([3.75,0,0]) circle(r=1);
}
