; Filament: PLA Genaric .6mm
M140 S60                     ; Set bed temperature
G10 P0 R150 S190             ; Tool 0: Standby temperature 150°C, Active temperature 190°C
M109 S190                    ; Wait for nozzle to reach temperature


; Brand-Specific Settings
M207 S1.2 F2100 Z0.5           ; Retraction settings
M572 D0 S0.028                 ; Pressure advance
M404 N1.75 D0.6              ; Set nozzle size

