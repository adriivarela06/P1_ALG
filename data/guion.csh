#!/bin/csh
@ inicio = 100
@ fin = 20000
@ incremento = 200
set ejecutable = burbuja
set salida = burbuja.dat
@ i = $inicio
echo "" >> $salida
while ( $i < $fin)
	./$ejecutable 42 $i >> $salida
	@ i += $incremento
end
