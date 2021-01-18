block_size = 15;
base_height = 6;
// x plane split into 4 blocks
base_width = 4 * block_size;
// y plane split into 6 blocks
base_length = 6 * block_size;
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
        translate([(w+6)/2,(l+6)/2,-1]) linear_extrude(10) circle(3, $fn=120);
    }
}

// Cut all the way through the base block on a grid line defined by the block
// size
module cutter(x1,y1,x2,y2,z,h) {
    x1c = x1 * block_size - gap/2;
    y1c = y1 * block_size - gap/2;
    x2c = x2 * block_size + gap/2;
    y2c = y2 * block_size + gap/2;
    cutx = x1 == x2 ? gap : x2c-x1c;
    cuty = y1 == y2 ? gap : y2c-y1c;
    translate([x1c,y1c,z]) linear_extrude(h) {
        square([cutx,cuty]);
    }
}

// Cut lines of a fixed width out of the puzzle block
module jigsaw(x1,y1,x2,y2) {
    cutter(x1,y1,x2,y2,-1,base_height+2);
}

module groove(x1,y1,x2,y2) {
    cutter(x1,y1,x2,y2,base_height-0.5,1);
}

module cut_grid() {
    for (x = [1:3]) {
        groove(x,0,x,6);
    }
    for (y = [1:5]) {
        groove(0,y,4,y);
    }
}


module sign() {
    mirror() translate([-3, 3 ,-0.8]) {
        linear_extrude(1) rotate(90) text("Foraker", size=10);
    }
}
