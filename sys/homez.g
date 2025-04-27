; homez.g
; Called to home the Z axis

if move.axes[2].homed
    echo "Z axis is already homed."
    M99                       ; Exit if already homed

; Move to the center of the bed
G90                          ; Absolute positioning
G1 X87.5 Y105 F30000         ; Move quickly to center of the bed

; Set probe speed for faster homing
M558 F500                   ; Set faster Z probing speed (adjust if needed)

; Home Z axis using probe
G30                          ; Home Z by probing
M400
; Reset probe speed to default (optional)
M558 F200                    ; Restore default probing speed

G30
; Lift Z slightly after probing
M400
G91
M400                          
G1 Z10 F3000                 ; Lift Z faster
G90                          ; Back to absolute positioning
G1 X0 Y0 F10000           ; Move to 0,0,10 at a safe speed
M400