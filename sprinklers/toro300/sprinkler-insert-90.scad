include <common.scad>

difference() {
    sprinkler_insert(90);
    translate([-3,10,-0.5]) {
        linear_extrude(1) mirror([0,1,0]) text("90", 4);
    }
}
