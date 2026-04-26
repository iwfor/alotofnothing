$fn=48;
width = 20; // width of wall backer
rdiff = 3;
rwidth = width-rdiff*2;
rdepth = 5;
cdiff = 6;
cwidth = width-cdiff*2;
cdepth = 4;
height = 1.5 * 25.4; // 1.5 inches


module rail() {
    // Make the main rail segment
    translate([rdiff,0,0])
        cube([rwidth, rdepth, height]);
    translate([rdiff,rdepth/2,0])
        cylinder(r=rdepth/2,height);
    translate([width-rdiff,rdepth/2,0])
        cylinder(r=rdepth/2,height);
    // Make the connection between the rail and the wall backer
    translate([cdiff, rdepth, 0])
        cube([cwidth, cdepth, height]);
    // Make the wall backer
    translate([0,rdepth+cdepth,0])
        cube([width, cdepth, height]);
}
