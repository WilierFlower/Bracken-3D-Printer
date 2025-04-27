; unload.g
; Script to unload filament

; Turn on part cooling fan to 50%
M106 S128                     ; Set part cooling fan to 50%

; Heat nozzle to 160°C
M104 S180                     ; Set nozzle temperature
M116 H1                       ; Wait for nozzle to stabilize at 160°C
G4 S10                        ; Hold temperature for 10 seconds

; Retract filament
G1 E-200 F7200                ; Retract 200mm at max speed (7200mm/min)

; Prompt user for acknowledgment
M291 R"Filament Retraction Complete" P"Would you like to load a new filament?" S4 K{"Yes","No"}

; User response handling
if input == 0
    M106 S0                   ; Turn off part cooling fan
    echo "Fan turned off. Ready for new filament."
elif input == 1
    M106 S0                   ; Turn off part cooling fan
    M104 S0                   ; Turn off nozzle heater
    M140 S0                   ; Turn off bed heater
    echo "Fan and heaters turned off. Filament unloaded."
else
    echo "No action taken. All systems remain active."
