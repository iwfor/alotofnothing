$fn=16;
w = 50.8;
h = 152.4;

difference() {
    union() {
        cube([w,w,h]);
        translate([0,0,h-25.4]) {
            sphere(r=3);
            intersection() {
                cylinder(h=50.8,r=3);
                translate([-3,-3,0])
                    cube([3,3,50.8]);
            }
            rotate([0,90,0]) cylinder(h=w,r=3);
            rotate([-90,0,0]) cylinder(h=w,r=3);
            translate([-3,0,0])
                cube([3,w,50.8]);
            translate([0,-3,0])
                cube([w,3,50.8]);
        }
    }
    for (i = [0:1]) rotate([0,0,i*90]) {
        translate([w/2,-6,h+12.2])
            rotate([-90,0,0]) cylinder(h=12,r=2);
    }
    translate([w/2,-1,12.2])
        rotate([-90,0,0]) cylinder(h=w+2,r=1);
    translate([-1,w/2,12.2])
        rotate([0,90,0]) cylinder(h=w+2,r=1);
}
