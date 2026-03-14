#!/bin/bash

# Definición de directorios
BIN_DIR="./bin"
DATA_DIR="./data"

# Crear el directorio de datos si no existe
mkdir -p "$DATA_DIR"

echo "=== Iniciando la batería de pruebas empíricas ==="

# -------------------------------------------------------------------------
# 1. Orden O(n^2) y peores casos
# Rango: 8000 a 200000, salto: 8000
# -------------------------------------------------------------------------
echo ">> Ejecutando algoritmos de eficiencia O(n^2)..."
for alg in insercion seleccion burbuja shellsort quicksortPeorcaso; do
    echo "   -> Probando $alg..."
    OUT_FILE="$DATA_DIR/${alg}.dat"
    > "$OUT_FILE" # Limpiamos el archivo si ya existía
    
    for (( n=8000; n<=200000; n+=8000 )); do
        tiempo=$("$BIN_DIR/$alg" "$n")
        # Gnuplot prefiere el formato: X Y (espaciados)
        echo "$n $tiempo" >> "$OUT_FILE"
    done
done

# -------------------------------------------------------------------------
# 2. Orden O(n log n)
# Rango: 500000 a 5000000, salto: 100000
# -------------------------------------------------------------------------
echo ">> Ejecutando algoritmos de eficiencia O(n log n)..."
for alg in mergesort heapsort quicksort; do
    echo "   -> Probando $alg..."
    OUT_FILE="$DATA_DIR/${alg}.dat"
    > "$OUT_FILE" 
    
    for (( n=500000; n<=5000000; n+=100000 )); do
        tiempo=$("$BIN_DIR/$alg" "$n")
        echo "$n $tiempo" >> "$OUT_FILE"
    done
done

# -------------------------------------------------------------------------
# 3. Exponenciales: Fibonacci O(((1+√5)/2)^n)
# Rango: 10 a 35, salto: 1
# -------------------------------------------------------------------------
echo ">> Ejecutando algoritmos exponenciales..."
echo "   -> Probando fibonacci..."
OUT_FILE="$DATA_DIR/fibonacci.dat"
> "$OUT_FILE"

for (( n=10; n<=35; n++ )); do
    tiempo=$("$BIN_DIR/fibonacci" "$n")
    echo "$n $tiempo" >> "$