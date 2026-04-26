include <parts.scad>
include <MCAD/2Dshapes.scad>

sw = 150;
sd = 100;
t = 5;
cr = 7.5;

module plate() {
    difference() {
        cube([sw,sd,t+2]);
        translate([cr,sd-cr,-0.01])
            linear_extrude(15) donutSlice(cr,cr*2, 90,180);
        translate([sw-cr,sd-cr,-0.01])
            linear_extrude(15) donutSlice(cr,cr*2, 0,90);
    }
}

module small_plate() {
    difference() {
        cube([sw-4,sd-4,t+2]);
        translate([cr,sd-4-cr,-0.01])
            linear_extrude(10) donutSlice(cr,cr*2, 90,180);
        translate([sw-4-cr,sd-4-cr,-0.01])
            linear_extrude(10) donutSlice(cr,cr*2, 0,90);
    }
}

module shelf() {
    difference() {
        plate();
        translate([2,2,t]) {
            small_plate();
        }
    }
    translate([sw/2-1.5,24,t])
        cube([3,sd-24,2]);
    translate([sw/2, 0, 2]) {
        intersection() {
            cylinder(r1 = 25, r2 = 18, h = height);
            translate([-25,0,0])
                cube([50, 25, height]);
        }
    }
}

difference() {
    shelf();
    color("yellow") translate([sw/2-4, -0.01, t-1.5])
        cube([8,10,2]);
    color("green") translate([sw/2-width/2, rdepth+cdepth*2-0.01, 2])
        mirror([0,1,0]) rail();
    color("red") translate([sw/2-width/2-0.25, -0.01, 2])
        cube([width+0.5,cdepth,height]);
}
