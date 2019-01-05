l = 100;
h = 50;
w = h * 0.78;
ledge = 5;

difference() {
    linear_extrude(h) {
        square([l,w]);
    }
    translate([-1,ledge,3]) {
        rotate([70,0,0])
            linear_extrude(h)
                square([l+2,w*2]);
    }
    translate([-1,w-2,-3]) {
        rotate([14,0,0])
            linear_extrude(h*1.2)
                square([l+2,w]);
    }
    
    // through width
    translate([l/2,2,h/2]) {
        rotate([270,90,0])
            linear_extrude(w)
               circle(h/2.85, $fn=100);
    }
    translate([l * 0.25,-1,1.5]) {
        rotate([270,90,0])
            linear_extrude(w)
               circle(ledge*2, $fn=100);
    }
    translate([l * 0.75,-1,1.5]) {
        rotate([270,90,0])
            linear_extrude(w)
               circle(ledge*2, $fn=100);
    }
    translate([l * 0.15,-1,h/2]) {
        rotate([270,90,0])
            linear_extrude(w)
               circle(ledge*1.5, $fn=100);
    }
    translate([l * 0.85,-1,h/2]) {
        rotate([270,90,0])
            linear_extrude(w)
               circle(ledge*1.5, $fn=100);
    }

    // through length
    translate([-1,w/2,0]) {
        rotate([0,90,0])
            linear_extrude(l+2)
                circle(w/4, $fn=100);
    }
    translate([-1,w/2+ledge/2,h/2]) {
        rotate([0,90,0])
            linear_extrude(l+2)
                circle(w/7.5, $fn=100);
    }
    
}