; homex.g
; Robust sensorless homing for the X axis with a post-stall offset move

; --- Use relative positioning and ensure moves are finished ---
G91
M400

; --- Set sensorless homing parameters ---
M913 X30         ; Reduce motor current for a gentle stall
M915 X S2 H400 R0 F0   ; Set sensitivity (S3) and stall threshold (H400)
M574 X1 S3       ; Configure sensorless endstop for the low (negative) end
M201.1 X100      ; Reduce acceleration to avoid false triggers
G1 H2 Z5 F1200   ; Lift Z to clear the nozzle

; --- Sensorless homing move ---
G1 H1 X-400 F6000   ; Homing move: move in the negative direction until stall

; --- Post-stall offset ---
; After the stall is detected and logged, move the X axis +15mm away from the sensorless zone.
G1 H2 X21.5 F2500

; --- Restore normal settings ---
M98 P"motorsfull.g"      ; Restore full motor currents
M98 P"speeds_and_feeds.g" ; Restore normal acceleration, jerk, etc.
G90                     ; Return to absolute positioning
