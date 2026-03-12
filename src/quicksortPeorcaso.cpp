#include <iostream>
#include <ctime>
#include <cstdlib>
#include <algorithm>

using namespace std;

// Función de partición (idéntica a la anterior)
int particion(int T[], int inicial, int final) {
   int pivote = T[final]; 
   int i = inicial - 1;
   for (int j = inicial; j < final; j++) {
      if (T[j] <= pivote) {
         i++;
         swap(T[i], T[j]);
      }
   }
   swap(T[i + 1], T[final]);
   return i + 1;
}

void quicksort(int T[], int inicial, int final) {
   if (inicial < final) {
      int pos = particion(T, inicial, final);
      quicksort(T, inicial, pos - 1);
      quicksort(T, pos + 1, final);
   }
}

int main(int argc, char *argv[]) {
   if (argc < 3) return 1;

   int n = atoi(argv[2]);
   int *T = new int[n];

   // --- CLAVE PARA EL PEOR CASO ---
   // En lugar de rand(), llenamos el vector ya ordenado
   for(int i = 0; i < n; i++) {
      T[i] = i; 
   }

   clock_t tantes = clock();
   quicksort(T, 0, n - 1);
   clock_t tdespues = clock();

   double tiempo = (double)(tdespues - tantes) / CLOCKS_PER_SEC;
   cout << n << " " << tiempo << endl;

   delete[] T;
   return 0;
}
