; load.g
; Script to load filament

; Heat nozzle to 200°C for loading
M104 S210                     ; Set nozzle temperature
M116 H1                       ; Wait for nozzle to stabilize at 200°C

; Prompt user to insert filament
M291 R"Insert Filament" P"Please insert the new filament and press OK to continue." S2

var loading_complete = false  ; Initialize variable to track loading status

while !var.loading_complete
    ; Extrude filament slowly to load
    G1 E50 F300               ; Extrude 50mm of filament at a slow speed

    ; Prompt user to confirm filament is loaded correctly
    M291 R"Confirm Filament Loading" P"Is the filament loaded correctly?" S4 K{"Yes","No"}

    ; User response handling
    if input == 0
        set var.loading_complete = true
        echo "Filament loading completed. Ready to print."
        G92 E0                 ; Reset extrusion count
    elif input == 1
        echo "Retrying filament loading..."
        G1 E20 F300            ; Extrude an additional 20mm of filament
        G4 S2                  ; Wait briefly
    else
        echo "No action taken. Please verify filament loading manually."
        break                  ; Exit the loop if no valid input
