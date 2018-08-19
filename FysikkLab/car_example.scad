$fn=30;
module car(){
    dx = 100.0;
    dx2 = 350.0;
    color([0.870, 0.176, 0.149])
    difference(){
    intersection(){
    rotate([90, 0, 0])
    linear_extrude(height=200.0)
    import(file = "side.dxf");
    
    translate([0, -160, 0])
    rotate([90, 0, 90])
    linear_extrude(height=500.0)
    import(file = "front.dxf");
    }
    
    translate([140.0, 0, 50.0])
    rotate([90, 0, 0])
    linear_extrude(height=200.0)
    import(file = "windows.dxf");
    
    translate([dx, 0, 0])
    rotate([90, 0, 0])
    cylinder(300.0, 30.0, 30.0);
    
    translate([dx2, 0, 0])
    rotate([90, 0, 0])
    cylinder(300.0, 30.0, 30.0);
}
    translate([dx, -140.0, 0])
    tire(30.0, 30.0);
    
    translate([dx, -30.0, 0])
    rotate([180, 0, 0])
    tire(30.0, 30.0);

    translate([dx2, -140.0, 0])
    tire(30.0, 30.0);
    
    translate([dx2, -30.0, 0])
    rotate([180, 0, 0])
    tire(30.0, 30.0);
    //tire(30.0, 30.0);
}

module tire(thickness, radius)
{
    color([0.1, 0.1, 0.1])
    difference(){
    rotate([90, 0, 0])
    cylinder(thickness, radius, radius);
    
    translate([0, 0.5*thickness, 0])
    rotate([90, 0, 0])
    cylinder(2*thickness, 0.5*radius, 0.5*radius);
    }
    
    color([0.6, 0.6, 0.6])
    rotate([90, 0, 0])
    cylinder(0.8*thickness, 0.5*radius, 0.5*radius);
}

module road()
{
    color([0.3, 0.3, 0.3])
    scale([2, 1, 2])
    translate([320, -300, -270])
    rotate([90, 0, 180])
    linear_extrude(height=400.0)
    import(file = "road.dxf");
}
car();
road();