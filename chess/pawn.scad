include <common.scad>
d = small_base;
rad = d/2;

b = 0;
translate([0,0,b]) cylinder(h=base_height,r=rad,$fn=64);
b0 = b + base_height;
translate([0,0,b0]) cylinder(h=base_height,r1=rad,r2=rad*0.75,$fn=64);
b1 = b0 + base_height+1;
translate([0,0,b1]) resize([d*0.85,d*0.85,base_height]) sphere(r=3, $fn=64);
translate([0,0,b1]) cylinder(h=base_height*3.5, r1=rad*0.6, r2=rad*0.4, $fn=64);
b2 = b1 + base_height*3.5+4;
translate([0,0,b2]) sphere(r=rad*0.6, $fn=64);