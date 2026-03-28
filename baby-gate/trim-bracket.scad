
$fn=32;

trim_width = 20;    // est
trim_height = 50;   // est
trim_angle = 15;    // degrees; est
gate_foot_d = 35;
gate_foot_r = gate_foot_d/2;
padding = 10;
padding_h = 25;

module screw_hole() {
    cylinder(r=5, h=5);
    cylinder(r=1.75, h=d+5);
    translate([0,0,5]) cylinder(r1=5, r2=1.75, h=3);
}

h = trim_height+padding_h;
w = gate_foot_d+padding;
d = trim_width+padding;
difference() {
    cube([w,d,h]);
    translate([-0.01,d-5,h-trim_height]) {
        color("blue") cube([w+0.1, 6, 10]);
        color("red") rotate([trim_angle,0,0])
            cube([w+0.1, trim_width+0.1, trim_height+5]);
    }
    translate([w/2, -0.01, h-gate_foot_r-5]) rotate([-90,0,0])
    color("yellow") cylinder(r=gate_foot_r+2.5, h=1.5);
    // Add the screw hole
    translate([w/2, -0.01, padding_h/2]) rotate([-90,0,0]) screw_hole();
}

//translate([-5,-5,0]) screw_hole();
