#!/bin/csh

# Definición de la ruta de datos relativa al script
set dir_datos = "../data"

# --- GRUPO 1: ALGORITMOS O(n^2) ---
# Incluye el peor caso de Quicksort, Heapsort y Shellsort como pide el guion 
foreach ejecutable (insercion seleccion burbuja shellsort quicksortPeorcaso)
    set salida = "${dir_datos}/${ejecutable}.dat"
    echo "Ejecutando $ejecutable (Orden Cuadratico)..."
    
    # Limpiar archivo de salida anterior
    echo -n "" > $salida
    
    @ i = 8000
    while ($i <= 200000)
        # Ejecución: semilla 42 y tamaño $i [cite: 217, 359]
        ./../bin/$ejecutable 42 $i >> $salida
        @ i += 8000
    end
end

# --- GRUPO 2: ALGORITMOS O(n log n) ---
foreach ejecutable (mergesort heapsort quicksort)
    set salida = "${dir_datos}/${ejecutable}.dat"
    echo "Ejecutando $ejecutable (Orden Logaritmico)..."
    
    echo -n "" > $salida
    
    @ i = 500000
    while ($i <= 5000000)
        # Tamaños de 500k a 5M según el guion [cite: 360]
        ./../bin/$ejecutable 42 $i >> $salida
        @ i += 100000
    end
end

# --- GRUPO 3: EXPONENCIALES ---
# Fibonacci: de 10 a 35 [cite: 364]
set ejecutable = "fibonacci"
set salida = "${dir_datos}/${ejecutable}.dat"
echo "Ejecutando $ejecutable..."
echo -n "" > $salida
@ i = 10
while ($i <= 35)
    ./../bin/$ejecutable 42 $i >> $salida
    @ i += 1
end

# Hanoi: de 3 a 33 [cite: 365]
set ejecutable = "hanoi"
set salida = "${dir_datos}/${ejecutable}.dat"
echo "Ejecutando $ejecutable..."
echo -n "" > $salida
@ i = 3
while ($i <= 33)
    ./../bin/$ejecutable 42 $i >> $salida
    @ i += 1
end

echo "Proceso finalizado. Los resultados se encuentran en la carpeta: $dir_datos"