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
wedgeHeight=5.0;
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
    translate([-(clipHandleWidth/2.0),-9,0]){
        cube([clipHandleWidth,clipHandleLength,clipHandleHeight], center=false);
    }

    CubePoints = [
    [  -21.0,  -9.0,  0 ],  //0
    [ -11.0,  0,  0 ],  //1
    [ 11.0,  0,  0 ],  //2
    [  21.0,  -9.0,  0 ],  //3
    [  -21.0,  -9.0,  5 ],  //4
    [ -11.0,  0,  3.0 ],  //5
    [ 11.0,  0,  3.0 ],  //6
    [  21.0,  -9,  5 ]]; //7
    
    CubeFaces = [
    [0,1,2,3],  // bottom
    [4,5,1,0],  // front
    [7,6,5,4],  // top
    [5,6,2,1],  // right
    [6,7,3,2],  // back
    [7,4,0,3]]; // left
    
    polyhedron( CubePoints, CubeFaces );
}