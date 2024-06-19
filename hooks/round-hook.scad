

$fa = 1;
$fs = 0.4;
wheel_radius = 10;
tyre_diameter = 4;

difference() {
    union() {
        cube([16,50,4], center = true);
        rotate([0,90,0]) translate([-6.5,0,0]) rotate_extrude(angle=360) {
            translate([wheel_radius - tyre_diameter/2, 0])
                circle(d=tyre_diameter);
        }
    }
    translate([0,0,-3]) cube([17,51,4.2], center=true);
}
