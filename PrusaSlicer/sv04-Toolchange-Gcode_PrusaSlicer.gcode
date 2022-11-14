;retract a bit to stop it blobbing
G1 E-1; note this will be re-extruded via extruder settings
;raise nozzle
G1 Z{(layer_z)+2}
;drop temp to idle
M104 S{(temperature[current_extruder])-20}
;park and change tool
T[next_extruder]
;raise to operating temp
M104 S[temperature]
M109 S[temperature]
;lower into position
G1 Z{(layer_z)}