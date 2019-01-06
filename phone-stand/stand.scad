l = 100;
h = 50;
w = h * 0.89;
ledge = 10;

module front_hole(x,z,r) {
    translate([x,-1,z]) {
        rotate([270,90,0])
            linear_extrude(w)
               circle(r, $fn=100);
    }
}

difference() {
    linear_extrude(h) {
        square([l,w]);
    }
    translate([-1,ledge,4]) {
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
    front_hole(l/2,h/2,h/3);
    front_hole(l * 0.25, 0, 7);
    translate([l * 0.25 - 7, -1, 0]) {
        linear_extrude(10)
            square([14,ledge+1]);
    }
    front_hole(l * 0.75, 0, 7);
    translate([l * 0.75 - 7, -1, 0]) {
        linear_extrude(10)
            square([14,ledge+1]);
    }
    front_hole(l * 0.16, h *0.45, ledge*1.1);
    front_hole(l * 0.87, h * 0.55, ledge*0.9);
    front_hole(l * 0.04, h * 0.25, ledge/4);
    front_hole(l * 0.96, h * 0.25, ledge/4);
    front_hole(l * 0.04, h * 0.75, ledge/4);
    front_hole(l * 0.92, h * 0.85, ledge/5);
    front_hole(l * 0.7, h * 0.33, ledge/4);
    front_hole(l * 0.3, h * 0.67, ledge/4);
    front_hole(l * 0.2, h * 0.85, ledge/3);
    front_hole(l * 0.73, h * 0.75, ledge/3);
    front_hole(l * 0.33, h * 0.21, ledge/4);
    front_hole(l * 0.56, h * 0.89, ledge/4);

    // through length
    translate([-1,w/2+ledge/3,0]) {
        rotate([0,90,0])
            linear_extrude(l+2)
                circle(w/4, $fn=100);
    }
    translate([-1,w/2+ledge/2,h/2]) {
        rotate([0,90,0])
            linear_extrude(l+2)
                circle(w/8, $fn=100);
    }
    
}