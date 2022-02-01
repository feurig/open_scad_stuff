$fa = 1;
$fs = 0.4;

module bevelled_screw_hole(diameter=3,depth=15,location=[0.0,0.0,0.0],rotation=[0.0,0.0,0.0]) {
    R=diameter/2.0;
    translate(location) {
        rotate(rotation){
            union(){
                translate([0,0,depth-R]) {
                    cylinder(h=R,
                            r1=R,
                            r2=R*2,
                            center=false);
                }
                translate([0,0,depth]) {
                    cylinder(h=R*2,r=R*2,center=false);
                }
                cylinder(h=depth-R,r=R,center=false);
           }
        }
    }
}

bevelled_screw_hole(rotation=[0,90,0],location=[0,15,3]);
bevelled_screw_hole(diameter=6,depth=8,rotation=[0,90,0],location=[0,0,5]);
bevelled_screw_hole(rotation=[0,90,0],location=[0,-15,3]);