stl = "Robo3D - X Motor.stl";
//stl = "Robo3D - X Motor (coarse).stl";

screw_hole_d = 4.0; // M3
screw_hole_countersink_d = 7.8; // M3
screw_hole_countersink_h = 2; // M3

nut_hole_w = 7; // M4 nut at flats
nut_hole_l = 8; // M4 nut at points
nut_hole_h = 3.5;
nut_hole_z_offset = 1.5;

scale_factor = 1.003; // to compensate for filament shrinkage

ff=0.01;

module import_reference() {
	difference() {
		translate([-137.6, -13.6, -108.8]) import(stl);

		// enlarge shaft holes to 8mm with clearance
		for (sign=[1,-1]) {
			translate([7.4,((91-8.2)/2)*sign,10]) rotate([0,270,0]) cylinder(d=8.2, h=30, $fn=32);
		}
	}
}

module screw_hole(screw_d) {
	cylinder(d=screw_d, h=20+(ff*2), $fn=32);
	translate([-nut_hole_l*1.5, -nut_hole_w/2, nut_hole_z_offset]) {
		cube([nut_hole_l*2, nut_hole_w, nut_hole_h]);
	}
	translate([0,0,20-screw_hole_countersink_h+ff])
		cylinder(d=screw_hole_countersink_d, h=screw_hole_countersink_h, $fn=32);
}

module lower() {
	difference() {
		import_reference();
		translate([0,-45-13.6,10]) cube([7.4,30,11]);
		translate([0,42-13.6,10]) cube([7.4,26,10]);
		translate([4, 0-13.6, -ff]) {
			translate([0, -35, 0]) screw_hole(screw_hole_d );
			translate([0,-20, 0]) screw_hole(screw_hole_d );
			translate([0, 62.5, 0]) screw_hole(screw_hole_d);
			translate([0,47.5, 0]) screw_hole(screw_hole_d);
		}
	}
}

module upper_forward() {
	difference() {
		intersection() {
			import_reference();
			translate([0,-41-13.6,10]) cube([7.4,26,11]);
		}
		translate([4, -13.6, -ff]) {
			translate([0, -35, 0]) screw_hole(screw_hole_d);
			translate([0,-20, 0]) screw_hole(screw_hole_d);
		}
	}
}

module upper_rearward() {
	difference() {
		intersection() {
			import_reference();
			translate([0,42-13.6,10]) cube([7.4,26,11]);
		}
		translate([4, -13.6, -ff]) {
			translate([0, 62.5, 0]) screw_hole(screw_hole_d);
			translate([0,47.5, 0]) screw_hole(screw_hole_d);
		}
	}
}

module lower_with_dropped_floor() {
	module dropped_floor() {
		intersection() {
			lower();
			translate([20.1,-33,6]) cube([50,60,2]);
		}
	}

	difference() {
		union() {
			lower();
			hull() {
				dropped_floor();
				translate([0,0,-6]) dropped_floor();

				// fill the seam
				translate([19,-30.7,0]) cube([5,53.5,2]);
			}
		}
		// open wire gap
		translate([34,-27,-0.1]) cube([18,20,20]);
	}

}

scale([scale_factor,scale_factor,scale_factor]) {

/*intersection(){
	lower();
	translate([-1,-41-13.6,0]) cube([9.7,26,21]);
}*/

/*intersection(){
	lower();
	translate([-1,-24,0]) color("red") cube([21,49,10]);
}*/

/*lower();*/
lower_with_dropped_floor();

/*translate([-10,25,-10])
	upper_forward();*/
/*translate([-10,-25,-10])
	upper_rearward();*/

/*screw_hole(screw_upper_lower_d);*/

/*//scale checking of shaft hole
intersection(){
scale([1.07,1.07,1.07]) import_reference();
translate([-1,-29.85-13.6,10.7]) rotate([0,90,0]) cylinder(d=8, h=10, $fn=32);
}*/

/*//scale checking of width and shaft hold dia
difference() {
	intersection(){
		scale([1.0,1.0,1.0])
			import_reference();
			translate([0,-35.5-13.6,0])
				translate([0.0005,0,-0.004])
					color("red") cube([20-0.001,15,20-0.0005]);
	}
	translate([7.4,((91-8)/2)*-1,10]) rotate([0,270,0]) cylinder(d=8.2, h=30, $fn=32);
}*/

/*
translate([0,0,0]) intersection() {
	scale([1.00,1.00,1.00]) import_reference();
	translate([-1,-50,0]) cube([25,120,10]);
}


for (sign=[1,-1]) {
	translate([7.4,((91-8)/2)*sign,10]) rotate([0,270,0]) cylinder(d=8, h=30, $fn=32);
}*/

} // end scale
