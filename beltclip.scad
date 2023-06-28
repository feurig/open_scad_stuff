// -------------------------------------------------------------beltclip.scad
//
//
//
//
$fa = 1;
$fs = 0.4;
clipLength=28.00;
clipHeight=2.75;
clipWidth=22.0;
clipHoleWidth=11.0;
clipHoleLength=19.0;
clipHandleWidth=52.0;
//clipHandleLength=3.0;
clipHandleHeight=6.0;
clipHandleOffset=-6.0;
wedgeHeight=clipHandleHeight;
wedgeWidth=46.0;
union(){
    difference (){

    translate([-(clipWidth/2.0),0,0]){
        cube([clipWidth,clipLength,clipHeight], center=false);
    }
    translate([-(clipHoleWidth/2.0),(clipLength-clipHoleLength)/2.0,-2.0]){
        cube([clipHoleWidth,clipHoleLength,clipHeight+4], center=false);
    }
    }
    translate([0.0,(clipHandleOffset),clipHandleHeight/2.0]){
        rotate([0,90,0]){
            cylinder(h=clipHandleWidth,d=clipHandleHeight, center=true);
        }
    }

    CubePoints = [
    [  -(wedgeWidth/2.0),  (clipHandleOffset),  0 ],  //0
    [ -(clipWidth/2.0),  0,  0 ],  //1
    [ (clipWidth/2.0),  0,  0 ],  //2
    [  (wedgeWidth/2.0),  (clipHandleOffset),  0 ],  //3
    [  -(wedgeWidth/2.0),  (clipHandleOffset), wedgeHeight ],  //4
    [ -(clipWidth/2.0),  0,  (clipHeight) ],  //5
    [ (clipWidth/2.0),  0,  (clipHeight) ],  //6
    [  (wedgeWidth/2.0),  (clipHandleOffset), wedgeHeight ]]; //7
    
    CubeFaces = [
    [0,1,2,3],  // bottom
    [4,5,1,0],  // front
    [7,6,5,4],  // top
    [5,6,2,1],  // right
    [6,7,3,2],  // back
    [7,4,0,3]]; // left
    
    polyhedron( CubePoints, CubeFaces );
}