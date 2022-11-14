; Stock gcode from sovol:

;Dual start
M140M140 S{material_bed_temperature};
M104 S{material_print_temperature};
M280 P0 S160;
G4 P100;
G28;
M190 S{material_bed_temperature};
M109 S{material_print_temperature};
G92 E0;
G1 X10.1 Y20 Z0.28 F5000.0;
G1 X10.1 Y200.0 Z0.28 F1500.0 E15;
G1 X10.4 Y200.0 Z0.28 F5000.0;
G1 X10.4 Y20 Z0.28 F1500.0 E30;
G92 E0 ;Reset Extruder
G1 Z2.0 F3000;

;--------------------------------------------------------------

; Modified gcode for prusaslicer:

;Dual start

M605 S1 ;Set printer to auto park mode
T0 ;Make sure to use left extruder
M140 S[first_layer_bed_temperature] ;start preheating the bed
G28 ;home all axes
M190 S[first_layer_bed_temperature] ; heat to bed setting in Cura and WAIT
G34; Run Z-Stepper auto align
G29; BLTOUCH Mesh Generation
G1 Z5 F5000 ; lift nozzle
M104 S[first_layer_temperature] ;start preheating the hotend
M104 T1 S{(first_layer_temperature[current_extruder])-20} ;Partially heat 2nd extruder
M109 S[first_layer_temperature]; Heat hotend to setting in CURA and wait

G92 E0; reset extruder 1
G1 X10.1 Y20 Z0.28 F5000.0;
G1 X10.1 Y200.0 Z0.28 F1500.0 E15;
G1 X10.4 Y200.0 Z0.28 F5000.0;
G1 X10.4 Y20 Z0.28 F1500.0 E30;
G92 E0 ;Reset Extruder 1
G1 Z2.0 F3000;

; new code to purge right extruder too
M104 S{(first_layer_temperature[current_extruder])-20}; partially cool down extruder 1
T1; switch extruder
; Fully heat it
M104 S[first_layer_temperature]
M109 S[first_layer_temperature]

; purge line

G92 E0;
G1 X10.6 Y20 Z0.28 F5000.0;
G1 X10.6 Y200.0 Z0.28 F1500.0 E15;
G1 X10.8 Y200.0 Z0.28 F5000.0;
G1 X10.8 Y20 Z0.28 F1500.0 E30;
G92 E0; Reset extruder
G1 Z2.0 F3000;

; back to idle temp
M104 S{(first_layer_temperature[current_extruder])-20}

; park and swap back to T0
T0