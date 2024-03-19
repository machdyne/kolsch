/*
 * Kölsch Case
 * Copyright (c) 2023 Lone Dynamics Corporation. All rights reserved.
 *
 * required hardware:
 *  - 4 x M3 x 25mm countersunk bolts
 *  - 4 x M3 nuts
 *
 */

$fn = 100;

board_width = 50;
board_length = 90;
board_height = 1.6;
board_spacing = 2;

wall = 1.5;

top_height = 19;
bottom_height = 6;

mdq_board();

translate([0,0,15])
	mdq_case_top();

translate([0,0,-15])
	mdq_case_bottom();

module mdq_board() {
	
	difference() {
		color([0,0.5,0])
			roundedcube(board_width,board_length,board_height, 5);
		translate([5, 5, -1]) cylinder(d=3.2, h=10);
		translate([5, 85, -1]) cylinder(d=3.2, h=10);
		translate([85, 5, -1]) cylinder(d=3.2, h=10);
		translate([85, 85, -1]) cylinder(d=3.2, h=10);
	}	
	
}

module mdq_case_top() {

	difference() {
				
		union() {
			color([0.5,0.5,0.5]) {
				roundedcube(board_width+(wall*2),board_length+(wall*2),top_height, 5);
	//			translate([-1,45,0]) cube([board_width+5, 5,16]);
	//			translate([-1,65,0]) cube([board_width+5, 5,16]);
	//			translate([-1,55,0]) cube([board_width+5, 5,16]);
	//			translate([-1,45,0]) cube([board_width+5, 5,16]);
	//			translate([50/2-10,-1,0]) cube([5, board_length+5,16]);
	//			translate([50/2-1.25,-1,0]) cube([5, board_length+5,16]);
			}
		}
		
		// cutouts
			
		translate([2,9.5,-2])
			roundedcube(board_width-1.25,board_length-16,18.75,2.5);

		translate([9.5,3,-2])
			roundedcube(board_width-16,board_length-3,10.25,2.5);
		
		translate([wall, wall, 0]) {

			// vents
			translate([25-12.5,75-0.5,0]) cube([25,1,20]);
			translate([25-12.5,65-0.5,0]) cube([25,1,20]);
			translate([25-12.5,55-0.5,0]) cube([25,1,20]);

			translate([-5,55-0.5,5]) cube([10,1,10]);
			translate([-5,45-0.5,5]) cube([10,1,10]);
			translate([-5,35-0.5,5]) cube([10,1,10]);
			translate([-5,25-0.5,5]) cube([10,1,10]);
			translate([-5,15-0.5,5]) cube([10,1,10]);
			
			translate([45,65-0.5,5]) cube([10,1,10]);
			translate([45,60-0.5,5]) cube([10,1,10]);
			translate([45,55-0.5,5]) cube([10,1,10]);
			translate([45,50-0.5,5]) cube([10,1,10]);
			translate([45,45-0.5,5]) cube([10,1,10]);
						
			
			// VGA
			translate([30,90-65.29-(31/2),-1]) cube([30,31,12.5+1]);
		
			// PMOD
			translate([50-32.5-(16/2),-5,-1]) cube([16,30,5+1]);
			
			// audio jack
			translate([50-15-(6.2/2),-5,-1]) cube([6.2,30,5+1]);

			// USBC
			translate([30,90-14.325-(9.5/2),-1]) cube([30,9.5,3.5+1]);
			
			// USBA
			translate([25-(16/2),70,0]) cube([16,50,15.7+1]);
		
			// SD
			translate([-5,90-17.5-(15/2),-1]) cube([30,15,2+1]);

			// bolt holes
			translate([5, 5, -21]) cylinder(d=3.5, h=40);
			translate([5, 85, -21]) cylinder(d=3.5, h=40);
			translate([45, 5, -20]) cylinder(d=3.5, h=40);
			translate([45, 85, -21]) cylinder(d=3.5, h=40);

			// flush mount bolt holes
			translate([5, 5, top_height-1.5]) cylinder(d=5.25, h=4);
			translate([5, 85, top_height-1.5]) cylinder(d=5.25, h=4);
			translate([45, 5, top_height-1.5]) cylinder(d=5.25, h=4);
			translate([45, 85, top_height-1.5]) cylinder(d=5.25, h=4);
							
			// kolsch text
			rotate(270)
				translate([-25,22.5,top_height-0.5])
					linear_extrude(1)
						text("K Ö L S C H", size=5, halign="center",
							font="Ubuntu:style=Bold");

		}
		
	}	
}

module mdq_case_bottom() {
	
	difference() {
		color([0.5,0.5,0.5])
			roundedcube(board_width+(wall*2),board_length+(wall*2),bottom_height, 5);
		
		// cutouts
		translate([3,10,1.5])
			roundedcube(board_width-3,board_length-17,10,2.5);
				
		translate([10.5,2.5,1.5])
			roundedcube(board_width-17.5,board_length-2,10,2.5);

		translate([wall, wall, 0]) {
			
		// board cutout
		translate([0,0,bottom_height-board_height])
			roundedcube(board_width+0.2,board_length+0.2,board_height+1,2.5);

		translate([wall, wall, 0]) {

			// USBC
			translate([38.5,53.8-(9.5/2),5]) cube([10,9.5,10.5+1]);
			
		}

		// bolt holes
		translate([5, 5, -11]) cylinder(d=3.2, h=25);
		translate([5, 85, -11]) cylinder(d=3.2, h=25);
		translate([45, 5, -11]) cylinder(d=3.2, h=25);
		translate([45, 85, -11]) cylinder(d=3.2, h=25);

		// nut holes
		translate([5, 5, -1]) cylinder(d=7, h=4, $fn=6);
		translate([5, 85, -1]) cylinder(d=7, h=4, $fn=6);
		translate([45, 5, -1]) cylinder(d=7, h=4, $fn=6);
		translate([45, 85, -1]) cylinder(d=7, h=4, $fn=6);

		}
		
	}	
}

// https://gist.github.com/tinkerology/ae257c5340a33ee2f149ff3ae97d9826
module roundedcube(xx, yy, height, radius)
{
    translate([0,0,height/2])
    hull()
    {
        translate([radius,radius,0])
        cylinder(height,radius,radius,true);

        translate([xx-radius,radius,0])
        cylinder(height,radius,radius,true);

        translate([xx-radius,yy-radius,0])
        cylinder(height,radius,radius,true);

        translate([radius,yy-radius,0])
        cylinder(height,radius,radius,true);
    }
}
