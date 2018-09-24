// implement a tube for the hing pin to go through
module tube(opening, height, thickness) {
    translate([opening/2+thickness,0, opening/2+thickness]) {
        rotate([270,90,0]) difference() {
            cylinder(r=opening/2+thickness, h=height, $fn=64);
            translate([0,0,-0.5]) cylinder(r=opening/2, h=height+1, $fn=64);
        }
    }
}

// Put tubes together on a support structure for the hinge.  Should be reversible so two can go together to make a complete hinge.
module hinge(hinges = 2, opening = 1, h = 5) {
    thickness = 1.5;
    d = opening + thickness * 2;
    translate([d,0,0]) cube([5, h*hinges*2, thickness]);
    for (i = [0:hinges-1]) {
        translate([opening/2+thickness, h*i*2, 0])
            cube([thickness+opening/2, h, thickness]);
        translate([0, h*i*2, 0]) tube(opening, h-0.1, thickness);
    }
}

hinge(4, 1, 2.5);