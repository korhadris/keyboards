// -*- mode: c -*-

key_size = 19.05;
border_width = 3.0;
thickness = 4.0;
screw_diameter = 3.0;
screw_head_diameter = 6.0;
screw_head_depth = 1.5;
switch_side_slots = false;

$fn = 40;

// Each key is x, y, width, height. All in units of key size.
key_layout = [// Column 0
              [0.0, 0.375, 1.5, 1.0],
              [0.0, 1.375, 1.5, 1.0],
              [0.0, 2.375, 1.5, 1.0],
              [0.0, 3.375, 1.5, 1.0],
              [0.5, 4.375, 1.0, 1.0],
              // Column 1
              [1.5, 0.375, 1.0, 1.0],
              [1.5, 1.375, 1.0, 1.0],
              [1.5, 2.375, 1.0, 1.0],
              [1.5, 3.375, 1.0, 1.0],
              [1.5, 4.375, 1.0, 1.0],
              // Column 2
              [2.5, 0.125, 1.0, 1.0],
              [2.5, 1.125, 1.0, 1.0],
              [2.5, 2.125, 1.0, 1.0],
              [2.5, 3.125, 1.0, 1.0],
              [2.5, 4.125, 1.0, 1.0],
              // Column 3
              [3.5, 0.000, 1.0, 1.0],
              [3.5, 1.000, 1.0, 1.0],
              [3.5, 2.000, 1.0, 1.0],
              [3.5, 3.000, 1.0, 1.0],
              [3.5, 4.000, 1.0, 1.0],
              // Column 4
              [4.5, 0.125, 1.0, 1.0],
              [4.5, 1.125, 1.0, 1.0],
              [4.5, 2.125, 1.0, 1.0],
              [4.5, 3.125, 1.0, 1.0],
              [4.5, 4.125, 1.0, 1.0],
              // Column 5
              [5.5, 0.250, 1.0, 1.0],
              [5.5, 1.250, 1.0, 1.0],
              [5.5, 2.250, 1.0, 1.0],
              [5.5, 3.250, 1.0, 1.0],
              // Column 6
              [6.5, 0.250, 1.0, 1.5],
              [6.5, 1.750, 1.0, 1.0],
              [6.5, 2.750, 1.0, 1.0]];

// Same units as keys, only x, y values are needed
screw_layout = [// Bottom left
                [screw_head_diameter * 0.5 / key_size, 4.875],
                // Top left
                [screw_head_diameter * 0.5 / key_size, 0.3],
                // Top middle
                [3.45, 0.00],
                // Top right
                [7.00, 0.35],
                // Bottom right
                [6.80, 4.00],
                // Bottom middle
                [3.65, 5.10]];

// This will need to be removed from the plate
module switch_hole(thickness, side_slots=false) {
  plate_thickness = 1.5;
  mx_hole = 14.0;
  top_slot_depth = 1.5;
  side_slot_width = 3.0;
  side_slot_depth = 1.0;
  // Offset by -hole_fudge and add 2 * hole_fudge to ensure that it's
  // slightly larger than the requested size. This keeps the edges
  // from being in the same plane when performing differences.
  hole_fudge = 0.01;
  translate([(key_size - mx_hole) * 0.5,
             -key_size + (key_size - mx_hole) * 0.5,
             0])
  union() {
    translate([0, 0, -hole_fudge])
    cube([mx_hole, mx_hole, thickness + 2 * hole_fudge]);

    // Add a space for the bottom portion of the switch if a thick plate is created.
    if (thickness > plate_thickness) {
      translate([mx_hole * 0.33, -top_slot_depth, -hole_fudge])
        cube([mx_hole * 0.34, mx_hole + top_slot_depth * 2, thickness - plate_thickness + hole_fudge]);
    }

    if (side_slots) {
      translate([-side_slot_depth, 1, -hole_fudge])
        cube([mx_hole + 2 * side_slot_depth, side_slot_width, thickness + 2 * hole_fudge]);
      translate([-side_slot_depth, 10, -hole_fudge])
        cube([mx_hole + 2 * side_slot_depth, side_slot_width, thickness + 2 * hole_fudge]);
    }
  }
}  // switch_hole


// This will create all the keys that need to be differenced from the plate.
module create_keys(thickness, layout, side_slots=false) {
  for (key = layout) {
    x_offset = key[0];
    y_offset = key[1];
    key_width = key[2];
    key_height = key[3];
    translate([(x_offset + key_width * 0.5 - 0.5) * key_size,
               -(y_offset + key_height * 0.5 - 0.5) * key_size,
               0])
      if (key_height > key_width) {
        translate([0, -key_size, 0]) rotate([0, 0, 90])
        switch_hole(thickness, side_slots);
      } else {
        switch_hole(thickness, side_slots);
      }
  }  // for key
}  // create_keys


module screw_hole(thickness, diameter, head_diameter, head_depth) {
  hole_fudge = 0.01;
  translate([0, 0, -hole_fudge])
    cylinder(d=diameter, h=thickness + hole_fudge * 2.0);
  translate([0, 0, thickness - head_depth])
    cylinder(d=head_diameter, h=head_depth + hole_fudge);
}  // screw_hole


module create_screws(thickness, screws, diameter, head_diameter, head_depth) {
  for (screw = screws) {
    translate([screw[0] * key_size, -screw[1] * key_size, 0])
      screw_hole(thickness, diameter, head_diameter, head_depth);
  }  // for screw
}  // create_screws


module create_plate(thickness, key_layout, screw_layout, border_width, screw_head_diameter) {
  minkowski_offset = 0.001;
  cylinder_portion = 0.3;
  minkowski() {
    union() {
      cylinder(h=thickness * cylinder_portion - minkowski_offset, r=border_width);
      difference() {
        translate([0, 0, thickness * cylinder_portion - minkowski_offset])
          scale([1, 1, (thickness * (1 - cylinder_portion)) / border_width])
            sphere(border_width);
        translate([-border_width * 1.5, -border_width * 1.5, -border_width * 1.5])
          cube([3.0 * border_width, 3.0 * border_width, border_width * 1.5 + thickness * cylinder_portion - 2 *minkowski_offset]);
      }
    }
    hull() {
      for (key = key_layout) {
        x_offset = key[0];
        y_offset = key[1];
        key_width = key[2];
        key_height = key[3];
        translate([x_offset * key_size, -(y_offset + key_height) * key_size, 0])
          cube([key_width * key_size, key_height * key_size, minkowski_offset]);
      }  // for key
      for (screw = screw_layout) {
        translate([screw[0] * key_size, -screw[1] * key_size, 0])
          cylinder(d=screw_head_diameter, h=minkowski_offset);
      }  // for screw
    }  // hull
  }  // minkowsky
}  // create_plate


difference () {
  create_plate(thickness, key_layout, screw_layout, border_width, screw_head_diameter);
  create_keys(thickness, key_layout, true);
  create_screws(thickness, screw_layout, screw_diameter, screw_head_diameter, screw_head_depth);
}
