include <common.scad>

difference() {
    sprinkler_insert(60);
    translate([-3,10,-0.5]) {
        linear_extrude(1) mirror([0,1,0]) text("60", 4);
    }
}
