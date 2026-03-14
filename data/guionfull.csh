#!/bin/csh

# Ruta donde se guardarán los resultados (misma carpeta que el script)
set dir_datos = "."

/*# --- GRUPO 1: ALGORITMOS O(n^2) ---
# Incluye Inserción, Selección, Burbuja, Shellsort y el Peor Caso de Quicksort [cite: 733, 736]
foreach ejecutable (insercion seleccion burbuja shellsort quicksortPeorcaso)
    set salida = "${dir_datos}/${ejecutable}.dat"
    echo "Ejecutando $ejecutable (Orden Cuadratico)..."
    
    # Limpiar archivo de salida anterior
    echo -n "" > $salida
    
    # Rango: 8000 a 200000 con saltos de 8000 [cite: 741]
    @ i = 8000
    while ($i <= 200000)
        # Accedemos a bin subiendo un nivel desde data
        ../bin/$ejecutable 42 $i >> $salida
        @ i += 8000
    end
end

# --- GRUPO 2: ALGORITMOS O(n log n) ---
# MergeSort, HeapSort y QuickSort (Caso promedio) [cite: 733, 736]
foreach ejecutable (mergesort heapsort quicksort)
    set salida = "${dir_datos}/${ejecutable}.dat"
    echo "Ejecutando $ejecutable (Orden Logaritmico)..."
    
    echo -n "" > $salida
    
    # Rango: 500.000 a 5.000.000 con saltos de 100.000 [cite: 742]
    @ i = 500000
    while ($i <= 5000000)
        ../bin/$ejecutable 42 $i >> $salida
        @ i += 100000
    end
end

# --- GRUPO 3: EXPONENCIALES ---
# Fibonacci: Rango de 10 a 35
set ejecutable = "fibonacci"
set salida = "${dir_datos}/${ejecutable}.dat"
echo "Ejecutando $ejecutable..."
echo -n "" > $salida
@ i = 10
while ($i <= 35)
    # Quitamos el "42" porque Fibonacci no usa semilla
    ../bin/$ejecutable $i >> $salida
    @ i += 1
end

# Hanoi: Rango de 3 a 33 [cite: 747]
set ejecutable = "hanoi"
set salida = "${dir_datos}/${ejecutable}.dat"
echo "Ejecutando $ejecutable..."
echo -n "" > $salida
@ i = 3
while ($i <= 33)
    ../bin/$ejecutable 42 $i >> $salida
    @ i += 1
end

echo "Proceso finalizado. Los archivos .dat estan listos en la carpeta data."