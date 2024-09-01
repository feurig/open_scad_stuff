$fa = 1;
$fs = 0.4;
bheight = 5.0;
theight = 40.0;


difference(){
        scale([1.12,1.12,1]) {
            union() {
                linear_extrude(theight){
                    polygon(points=[[-5.0,0.0],[-50.0,-50.0],[50.0,-50],[5.0,0.0]]);
                }
                linear_extrude(theight){
                circle($fn = 0, $fa = 12, $fs = 2, r = 25.00);
                }
            }
        }
    
    translate([0,0,bheight]) {

        union() {
            linear_extrude(theight){
                polygon(points=[[-5.0,0.0],[-50.0,-50.0],[50.0,-50],[5.0,0.0]]);
            }
            linear_extrude(theight){
            circle($fn = 0, $fa = 12, $fs = 2, r = 25.00);
            }
        }
    }
}
