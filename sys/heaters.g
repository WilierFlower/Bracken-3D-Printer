; Heaters
M308 S0 P"bedtemp" Y"thermistor" T100000 B4092    ; configure sensor 0 as thermistor on pin bedtemp
M950 H0 C"bedheat" T0    ; create bed heater output on bedheat and map it to sensor 0
M307 H0 B0 S1.00    ; disable bang-bang mode for the bed heater and set PWM limit
M140 H0    ; map heated bed to heater 0
M143 H0 S120    ; set temperature limit for heater 0 to 120C
M308 S1 P"e0temp" Y"thermistor" T100000 B4725 C7.06e-8    ; configure sensor 1 as thermistor on pin e0temp
;M950 H1 C"e0heat" T1    ; create nozzle heater output on e0heat and map it to sensor 1
;M308 S1 P"e0temp" Y"pt1000" ; sensor 1
M950 H1 C"e0heat" T1 ; create heater and map sensor 1
M307 H1 R2.641 K0.463:0.158 D6.92 E1.35 S1.00 B0 V24.3    ; disable bang-bang mode for heater  and set PWM limit
M143 H1 S310

;Setting up MCU Temp
M308 S2 Y"mcu-temp" A"MCU" 