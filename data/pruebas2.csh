#!/bin/bash

# --- CONFIGURACIÓN DE RUTAS (Relativas desde la carpeta 'data') ---
# Como el script está dentro de 'data', subimos un nivel para encontrar src y bin
SRC_DIR="../src"
BIN_DIR="../bin"
DATA_DIR="." # Los archivos .dat se guardarán aquí mismo

# --- CONFIGURACIÓN DE COLORES ---
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}Preparando entorno de la práctica...${NC}"

# Crear directorio bin si no existe (está un nivel arriba)
mkdir -p "$BIN_DIR"

# 1. COMPILACIÓN DE TODOS LOS ARCHIVOS DESDE SRC A BIN
algoritmos=("burbuja" "fibonacci" "hanoi" "heapsort" "insercion" "mergesort" "quicksort" "quicksortPeorcaso" "seleccion" "shellsort")

echo -e "${BLUE}Compilando algoritmos...${NC}"

for alg in "${algoritmos[@]}"; do
    SRC_FILE="$SRC_DIR/$alg.cpp"
    BIN_FILE="$BIN_DIR/$alg"
    
    if [ -f "$SRC_FILE" ]; then
        # Compilamos indicando la ruta de salida en ../bin
        g++ -O2 "$SRC_FILE" -o "$BIN_FILE"
        if [ $? -eq 0 ]; then
            echo -e "  [OK] $alg compilado en $BIN_DIR/"
        else
            echo -e "  [ERROR] Fallo al compilar $alg"
        fi
    else
        echo -e "  [SKIP] No se encontró $SRC_FILE"
    fi
done

echo -e "\n${BLUE}Iniciando toma de tiempos (Análisis Empírico)...${NC}"

SEMILLA=42

# --- GRUPO 1: ALGORITMOS CUADRÁTICOS O(n^2) ---
# Rango: 8000 a 200000, salto 8000
cuadraticos=("burbuja" "insercion" "seleccion" "shellsort" "quicksortPeorcaso")
echo -e "${GREEN}Ejecutando algoritmos O(n^2)...${NC}"

for alg in "${cuadraticos[@]}"; do
    BIN_EXEC="$BIN_DIR/$alg"
    DATA_FILE="$DATA_DIR/$alg.dat"
    
    if [ -f "$BIN_EXEC" ]; then
        echo "  Procesando $alg -> $DATA_FILE"
        rm -f "$DATA_FILE"
        for n in $(seq 8000 8000 200000); do
            "$BIN_EXEC" $SEMILLA $n >> "$DATA_FILE"
        done
    fi
done

# --- GRUPO 2: ALGORITMOS N LOG N O(n log n) ---
# Rango: 500000 a 5000000, salto 100000
nlogn=("heapsort" "mergesort" "quicksort")
echo -e "${GREEN}Ejecutando algoritmos O(n log n)...${NC}"

for alg in "${nlogn[@]}"; do
    BIN_EXEC="$BIN_DIR/$alg"
    DATA_FILE="$DATA_DIR/$alg.dat"
    
    if [ -f "$BIN_EXEC" ]; then
        echo "  Procesando $alg -> $DATA_FILE"
        rm -f "$DATA_FILE"
        for n in $(seq 500000 100000 5000000); do
            "$BIN_EXEC" $SEMILLA $n >> "$DATA_FILE"
        done
    fi
done

# --- GRUPO 3: FIBONACCI O(1.618^n) ---
# Rango: 10 a 35, salto 1
if [ -f "$BIN_DIR/fibonacci" ]; then
    echo -e "${GREEN}Ejecutando Fibonacci (Exponencial)...${NC}"
    DATA_FILE="$DATA_DIR/fibonacci.dat"
    rm -f "$DATA_FILE"
    for n in $(seq 10 1 35); do
        "$BIN_DIR/fibonacci" $SEMILLA $n >> "$DATA_FILE"
    done
fi

# --- GRUPO 4: HANOI O(2^n) ---
# Rango: 3 a 33, salto 1
if [ -f "$BIN_DIR/hanoi" ]; then
    echo -e "${GREEN}Ejecutando Hanoi (Exponencial)...${NC}"
    DATA_FILE="$DATA_DIR/hanoi.dat"
    rm -f "$DATA_FILE"
    for n in $(seq 3 1 33); do
        "$BIN_DIR/hanoi" $SEMILLA $n >> "$DATA_FILE"
    done
fi

echo -e "\n${BLUE}¡Proceso finalizado! Los resultados están en la carpeta actual '$DATA_DIR'${NC}"
