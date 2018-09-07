base_height = 6;
base_width = 64;
base_length = 96;
// x plane split into 4 blocks
xstep = base_width / 4;
// y plane split into 6 blocks
ystep = base_length / 6;
gap = 0.5;

module base_block() {
  linear_extrude(base_height) square([base_width, base_length]);
}


module tray() {
    w = base_width;
    l = base_length;
    difference() {
        linear_extrude(4) square ([w+6,l+6]);
        translate([3-gap/2,3-gap/2,1.5]) linear_extrude(10) square([w+gap,l+gap]);
        translate([(w+6)/2,(l+6)/2,-1]) linear_extrude(10) circle(3);
    }
}

// Cut lines of a fixed width out of the puzzle block
module jigsaw(x1,y1,x2,y2) {
    cutter(x1,y1,x2,y2,-1,base_height+2);
}

module groove(x1,y1,x2,y2) {
    cutter(x1,y1,x2,y2,base_height-0.5,1);
}

module cutter(x1,y1,x2,y2,z,h) {
    x1c = x1 * xstep - gap/2;
    y1c = y1 * ystep - gap/2;
    x2c = x2 * xstep + gap/2;
    y2c = y2 * ystep + gap/2;
    cutx = x1 == x2 ? gap : x2c-x1c;
    cuty = y1 == y2 ? gap : y2c-y1c;
    translate([x1c,y1c,z]) linear_extrude(h) {
        square([cutx,cuty]);
    }
}

module cut_blocks() {
    // Maximum effort
    jigsaw(1,0,1,1);
    jigsaw(1,1,2,1);
    jigsaw(2,1,2,5);
    jigsaw(1,3,2,3);
    jigsaw(1,2,1,6);
    jigsaw(0,2,1,2);
    jigsaw(2,5,3,5);
    jigsaw(3,5,3,6);
    jigsaw(2,4,3,4);    
    jigsaw(3,3,3,4);
    jigsaw(3,3,4,3);
    jigsaw(3,1,3,2);
    jigsaw(2,2,3,2);
    jigsaw(3,1,4,1);
}

module cut_grid() {
    for (x = [1:3]) {
        groove(x,0,x,6);
    }
    for (y = [1:5]) {
        groove(0,y,4,y);
    }
}

translate([-base_width-3,0,0])
    difference() {
        base_block();
        cut_grid();
        cut_blocks();
    }

translate([3,0,0]) tray(base_width, base_length);