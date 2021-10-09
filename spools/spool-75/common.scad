include <MCAD/2Dshapes.scad>
include <polyround.scad>
include <threads.scad>

$fn = 64;

inside_dia = 55;
inside_r = inside_dia/2;
spool_dia = 75;
spool_r = spool_dia/2;
spool_w = 58;
wrapped_dia = 180;
wheel_dia = wrapped_dia+20;
wheel_r = wheel_dia/2;
wall = 3.5;
barrel_wall = 4;
ring = 2;
thread_dia = spool_dia-barrel_wall*2;

module wheel() {
    difference() {
        cylinder(r=wheel_r, h=wall);
        translate([0,0,-1]) cylinder(r=inside_r+ring+0.5,h=wall+2);
        // Cut filament lock holes
        for (i = [0:3]) {
            rotate([0,0,i*90]) {
                for (n = [0:1]) {
                    rotate([0,0,n*25]) translate([wheel_r-5,0,-0.01]) cylinder(r1=3,r2=1.5,h=wall+0.2);
                }
            }
        }
        // Make big cutouts
        for (i = [0:4]) {
            rotate([0,0,i*360/5]) {
                translate([0, spool_dia/2, -0.1]) cutout();
            }
        }
    }
}

module cutout() {
    size = 42;
    r = [80,20,30,50];
    p = [ [-26,0,20],[0,3,20],[26,0,20],
        [50,size,10],[20,size+9,10],[0,size+12,10],[-20,size+9,10],[-50,size,10] ];
    color("yellow") linear_extrude(wall+0.2) polygon( polyRound(p,10));
}
