//------------------------------------------------------------- pipe_clamp.scad
$fa = 1;
$fs = 0.4;
gapSize=0.5;
clampHeight=13.0;
pipeDiameter=35.5;
clampThickness=5;
baseThickness=5;
baseWidth=pipeDiameter*2.0;
gap2wall=8.0;

difference () {
    union (){
        translate([(pipeDiameter/2.0)+gap2wall,0,0]) {
            cylinder(h=clampHeight,
                    d=pipeDiameter+(clampThickness*2.0),
                            center=false);
                            
            }
        translate([baseThickness/2.0,0,clampHeight/2.0]){
            cube([baseThickness,baseWidth,clampHeight],center=true);
            } 
        translate([((pipeDiameter/2.0)+gap2wall)/2.0,0,clampHeight/2.0]){
            cube([(pipeDiameter/2.0)+gap2wall,
                  (pipeDiameter+(clampThickness*2.0)),
                   clampHeight],center=true);
        }
    }
    translate([(pipeDiameter/2.0)+gap2wall,0,0]) {
        cylinder(h=clampHeight*3.0,
                d=pipeDiameter,
                        center=true);    
    }
    translate([((pipeDiameter/2.0)+gap2wall)/2.0,(pipeDiameter-gapSize)/2.0,0]){
        cube([(pipeDiameter/2.0)+gap2wall,gapSize,clampHeight*3.0],center=true);
    }
    translate([((pipeDiameter/2.0)+gap2wall)/2.0,-(pipeDiameter-gapSize)/2.0,0]){
        cube([(pipeDiameter/2.0)+gap2wall,gapSize,clampHeight*3.0],center=true);
    }
}