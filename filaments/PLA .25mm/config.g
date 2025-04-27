; Filament: PLA Genaric .4mm
M140 S60                     ; Set bed temperature
G10 P0 R150 S190             ; Tool 0: Standby temperature 150°C, Active temperature 190°C
M109 S190                    ; Wait for nozzle to reach temperature


; Brand-Specific Settings
M207 S0.6 F2100 Z0.0           ; Retraction settings
M572 D0 S0.015                 ; Pressure advance
M404 N1.75 D0.25               ; Set nozzle size (e.g., 0.4mm)
