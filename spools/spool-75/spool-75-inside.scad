include <common.scad>

module solid1() {
    wheel();
    difference() {
        // cut threads
        translate([0,0,wall]) {
            metric_thread(diameter=thread_dia-0.5,pitch=5,length=15);
        }
        translate([0,0,wall-0.01]) cylinder(r=inside_r+ring,h=spool_w);
    }
    // Draw the inner barrel which will support the weight of the spool on a dispenser bar.
    difference() {
        translate([0,0,0]) {
            // Seal up the wheel opening
            cylinder(r=inside_r+ring+1,h=wall);
            cylinder(r=inside_r+ring,h=spool_w+wall*2);
        }
        translate([0,0,-0.01]) cylinder(r=inside_r,h=spool_w+wall*2+0.2);
    }

}

solid1();
