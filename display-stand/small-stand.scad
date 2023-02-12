w=50;

difference() {
    cube([w,10,10]);
    translate([-0.01,0,10]) rotate([-20,0,0]) cube([w+0.02,20,10]);
}
translate([2, 10, 0]) cube([5,25,5]);
translate([w-7,10,0]) cube([5,25,5]);

translate([0,8,6]) rotate([-20,0,0]) cube([w, 2, 35]);
