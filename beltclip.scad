// -------------------------------------------------------------beltclip.scad
//
//
//
//
$fa = 1;
$fs = 0.4;
clipLength=32.00;
clipHeight=3.0;
clipWidth=22.0;
clipHoleWidth=11.0;
clipHoleLength=22.0;
clipHandleWidth=52.0;
clipHandleLength=3.0;
clipHandleHeight=12.0;
clipHandleOffset=-6.0;
wedgeHeight=8.0;
wedgeWidth=42.0;
union(){
    difference (){

    translate([-(clipWidth/2.0),0,0]){
        cube([clipWidth,clipLength,clipHeight], center=false);
    }
    translate([-(clipHoleWidth/2.0),(clipLength-clipHoleLength)/2.0,-2.0]){
        cube([clipHoleWidth,clipHoleLength,clipHeight+4], center=false);
    }
    }
    translate([-(clipHandleWidth/2.0),(clipHandleOffset),0]){
        cube([clipHandleWidth,clipHandleLength,clipHandleHeight], center=false);
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