$fn = 64;
d = 54;
st = 130;   // max spool thickness

difference() {
    cylinder(r=d/2, h=st);
    translate([0,0,-0.01])
        cylinder(r=20.125, h=st+0.02);
}