#!/bin/csh

# --- GRUPO 1: ALGORITMOS O(n^2) ---
# Insercion, Seleccion, Burbuja, Shellsort
foreach ejecutable (insercion seleccion burbuja shellsort quicksortPeorcaso)
    set salida = "${ejecutable}.dat"
    echo "Ejecutando $ejecutable..."
    @ i = 8000
    while ($i <= 200000)
        ./../bin/$ejecutable 42 $i >> $salida
        @ i += 8000
    end
end

# --- GRUPO 2: ALGORITMOS O(n log n) ---
# Mergesort, Heapsort, Quicksort
foreach ejecutable (mergesort heapsort quicksort)
    set salida = "${ejecutable}.dat"
    echo "Ejecutando $ejecutable..."
    @ i = 500000
    while ($i <= 5000000)
        ./../bin/$ejecutable 42 $i >> $salida
        @ i += 100000
    end
end

# --- GRUPO 3: EXPONENCIALES ---
# Fibonacci
set ejecutable = "fibonacci"
set salida = "fibonacci.dat"
echo "Ejecutando $ejecutable..."
@ i = 10
while ($i <= 35)
    ./../bin/$ejecutable 42 $i >> $salida
    @ i += 1
end

# Hanoi
set ejecutable = "hanoi"
set salida = "hanoi.dat"
echo "Ejecutando $ejecutable..."
@ i = 3
while ($i <= 33)
    ./../bin/$ejecutable 42 $i >> $salida
    @ i += 1
end

echo "Proceso finalizado. Datos guardados en archivos .dat"