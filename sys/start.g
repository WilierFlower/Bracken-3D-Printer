; 0:/sys/start.g
; Executed before each print - BEFORE ANY SLICER CODE IS RAN
; This also loads the heightmap from the system's set filament type directory
; (0:/filaments/XXXX/heightmap.csv), if the heightmap does not exist, it will
; create one, and then save in the filament's directory. The HotMesh macro is
; a better choice to generate the heightmap as it performs a heat stabilization
; routine for ~5 minutes.

M122                                                       ; Clear diagnostic data to cleanly capture print evolution statistics. 
 
T0                                                         ; Ensure the tool is selected.
M572 D0 S0.0                                               ; Clear pressure advance.
M220 S100                                                  ; Set speed factor back to 100% in case it was changed.
M221 S100                                                  ; Set extrusion factor back to 100% in case it was changed.
M290 R0 S0                                                 ; Clear any baby-stepping.
M106 S0                                                    ; Turn part cooling blower off if it is on.
M703                                                       ; Execute loaded filament's config.g.
;G28                                                        ; Home all.
;G1 Z5 X100 Y100                                            ; Place nozzle center of the bed, 5mm up.


M116                                                       ; Wait for all temperatures.



G90                                                        ;  Set to Absolute Positioning.
;G4 S10                                                     ;  wait an additional 10s for the bed to stabilize.
G32                                                        ;  Level the gantry.
G29 S1 [P{"0:/filaments/" ^ move.extruders[0].filament ^ "/heightmap.csv"}] ; Load bed mesh for the system's set filament type.
if result > 1                                              ; If the file doesn't exist, perform mesh and save.
   G29                                                     ; Perform mesh now.
   G29 S3 [P{"0:/filaments/" ^ move.extruders[0].filament ^ "/heightmap.csv"}] ; Save heightmap.csv to filament type's directory.

M400                                                       ; Finish all moves, clear the buffer.
G90                                                        ; Absolute Positioning.
M83                                                        ; Extruder relative mode.
G1 X0 Y0 F1000                                              ; Final position before slicer's temp is reached and primeline is printed.
G1 Z1 F300                                                 ; Final position before slicer's temp is reached and primeline is printed.
;M290 S0.15  ; babystep the head up 0.15mm  For .25mm nozzle
; The primeline macro is executed by the slicer gcode to enable direct printing.
; of the primeline at the objects temp and to immediately print the object.
; following primeline completion. 
 
; Slicer generated gcode takes it away from here.