include <common.scad>

module solid1() {
    wheel();
    translate([0,0,wall]) {
        difference() {
            cylinder(r=spool_r,h=spool_w);
            translate([0,0,-0.01]) cylinder(r=spool_r-wall,h=spool_w-10.9);
            // cut threads
            translate([0,0,spool_w-12]) {
                metric_thread(diameter=spool_dia-wall*2+3,pitch=4,length=12.1);
            }
        }
    }
    difference() {
        cylinder(r=inside_r+ring,h=spool_w+wall*2);
        translate([0,0,-0.01]) cylinder(r=inside_r,h=spool_w+wall*2+0.2);
    }
}

solid1();
