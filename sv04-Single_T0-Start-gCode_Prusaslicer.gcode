;sv04 Single 01 start G-code - Prusaslicer

M140 S[first_layer_bed_temperature] ; Start preheating th ebed
G28; Home all axes
M190 S[first_layer_bed_temperature] ; heat to bed setting in Cura and WAIT
G34; Run Z-Stepper auto align
G29; BLTOUCH Mesh Generation
M104 T0 S[first_layer_temperature]; Start preheating the hotend
M280 P0 S160;
G4 P100;
T0
M109 T0 S[first_layer_temperature]; Heat hotend to setting and wait
G92 E0; Reset Extruder
G1 X5 Y20 Z0.28 F5000.0; Draw the first line
G1 X5 Y200.0 Z0.28 F1500.0 E15; Move to the side a little
G1 X5.5 Y200.0 Z0.28 F5000.0; Draw the second line
G1 X5.5 Y20 Z0.28 F1500.0 E30;
G92 E0 ;Reset Extruder
G1 Z2.0 F3000; Move Z-Axis up a little