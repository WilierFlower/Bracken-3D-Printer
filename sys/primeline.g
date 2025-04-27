; 0:/sys/primeline.g
; Print prime-line at a 'randomized' Y position from -1.1 to -2.9
 

M400		
	
;G1 X0 Z0.25 Y{-2+(0.1*(floor(10*(cos(sqrt(sensors.analog[0].lastReading * state.upTime))))))} F3000.0;
G1 X0 Z0.25 Y3
G92 E0.0                                                   ; Reset the extrusion distance.
G1 E8                                                      ; Purge Bubble.
G1 X60.0 E11.0 F1000.0                                     ; Intro line part 1.
G1 X120.0 E16.0 F1000.0                                    ; Intro line part 2.
G1 X122.0 F1000.0                                          ; Wipe 2mm of filament.
G92 E0.0                                                   ; Reset the extrusion distance.
M400 