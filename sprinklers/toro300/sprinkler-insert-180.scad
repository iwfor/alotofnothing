include <common.scad>

difference() {
    sprinkler_insert(180);
    translate([-4.5,10,-0.5]) {
        linear_extrude(1) mirror([0,1,0]) text("180", 4);
    }
}
