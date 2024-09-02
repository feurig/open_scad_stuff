//-------------------------------------------------------------zero_oclock.scad
$fa = 1;
$fs = 0.4;
bheight = 2.8;
theight = 40.0;


module part_1() {
    difference(){
        union() {
                linear_extrude(theight){
                    polygon(points=[[-8.0,0.0],[-40.0,-52.0],[40.0,-52],[8.0,0.0]]);
                }
                linear_extrude(theight){
                circle($fn = 0, $fa = 12, $fs = 2, r = 30.00);
                }
            }
        
        
        translate([0,0,bheight]) {

            union() {
                linear_extrude(theight){
                    polygon(points=[[-6.0,0.0],[-36.0,-50.0],[36.0,-50],[5.0,0.0]]);
                }
                linear_extrude(theight){
                circle($fn = 0, $fa = 12, $fs = 2, r = 28.00);
                }
            }
        }
    }
}
module part_2() {
    union(){
        difference(){
            union(){
                translate([0,0,bheight]) {

                    union() {
                            linear_extrude(bheight){
                                polygon(points=[[-8.0,0.0],[-40.0,-52.0],[40.0,-52],[8.0,0.0]]);
                            }
                            linear_extrude(bheight){
                            circle($fn = 0, $fa = 12, $fs = 2, r = 30.00);
                            }
                        }
                    
                }
                union() {
                    linear_extrude(bheight){
                        polygon(points=[[-6.0,0.0],[-36.0,-50.0],[36.0,-50],[5.0,0.0]]);
                    }
                    linear_extrude(bheight){
                    circle($fn = 0, $fa = 12, $fs = 2, r = 28.00);
                    }
                }
                
            }
            translate([0,0,-(bheight/2.0)]) {
                linear_extrude(bheight*3.0){
                    circle($fn = 0, $fa = 12, $fs = 2, r = 26.00);
                }
            }

        }
        
            translate([0.0,-45.5,(bheight*2.0)+5.0]) {
                difference(){
                cube(13,10,10,center=true);
                rotate([90,0,0]) { 
                    cylinder(r=3,h=20,center=true);
                }
            }

        }        
    }
}

// part_1()
part_2();