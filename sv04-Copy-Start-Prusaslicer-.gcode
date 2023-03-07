;Copy start G-code
M605 S2; Set printer to copy mode (Duplication mode in marlin)
M140 S[first_layer_bed_temperature]; Start Preheating the bed
G28; Home all axes
M190 S[first_layer_bed_temperature] ; heat to bed setting in Cura and WAIT
G34; Run Z-Stepper auto align
G29; BLTOUCH Mesh Generation
M104 S[first_layer_temperature]; Start preheating the hotend
M280 P0 S160;
G4 P100;
M109 S[first_layer_temperature]; Heat hotend to setting in CURA and wait
G92 E0; Reset Extruder 1
G1 X10.1 Y20 Z0.28 F5000.0;
G1 X10.1 Y200.0 Z0.28 F1500.0 E15;
G1 X10.4 Y200.0 Z0.28 F5000.0;
G1 X10.4 Y20 Z0.28 F1500.0 E30;
G92 E0; Reset Extruder 1
G1 Z2.0 F3000;