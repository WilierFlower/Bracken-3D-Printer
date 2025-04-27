; stop.g
; called when a print is cancelled after a pause.
M83                                                        ; Set extruder to relative mode.
M106 S255                                                  ; Turn the part cooling fan fully on.
M572 D0 S0.0                                               ; Clear pressure advance.
M220 S100                                                  ; Set the speed factor back to 100% incase it was changed.
M221 S100                                                  ; Set the extrusion factor back to 100% incase it was changed.
G1 E-2                                                     ; Retract 2mm of filament.
M104 S-273                                                 ; Turn off the hotend.
M140 S-273                                                 ; Turn off the heatbed.



; Let cool and wiggle for bit to reduce end stringing

G91                                                        ; Set to Relative Positioning.
G1 Z2 F400                                                 ; Move Z axis up 3mm.

G90                                                        ; Set to Absolute Positioning.

G1 X220 Y210 Z205 F1200                                     ; Place nozzle to the right side, build plate to front, Z at top.
M400                                                       ; Finish all moves, clear the buffer.
M107                                                       ; Turn off the part cooling fan.
M18                                                        ; Unlock the X, Y, and E axis.

M400                                                       ; Finish all moves, clear the buffer.
