$fn=16;
w = 50.8;
h = 152.4;

cube([w,w,h]);
difference() {
    translate([0,0,h-25.4]) {
        sphere(r=3);
        cylinder(h=50.8,r=3);
        rotate([0,90,0]) cylinder(h=w,r=3);
        rotate([-90,0,0]) cylinder(h=w,r=3);
        translate([-3,0,0])
            cube([3,w,50.8]);
        translate([0,-3,0])
            cube([w,3,50.8]);
    }
    translate([0,0,h]) cube([3,3,26]);
    translate([0,0,h+12.2]) {
        for (i = [0:1]) rotate([0,0,i*90])
            translate([w/2,-6,0])
                rotate([-90,0,0]) cylinder(h=12,r=2);
    }
}
