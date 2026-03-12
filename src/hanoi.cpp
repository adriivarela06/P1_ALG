#include <iostream>
#include <chrono>
#include <cstdlib>

using namespace std;
void hanoi(int n, int origen, int auxiliar, int destino) {
   if (n > 0) {
      hanoi(n - 1, origen, destino, auxiliar);
      hanoi(n - 1, auxiliar, origen, destino);
   }
}

int main(int argc, char *argv[]) {
   int n;
   std::chrono::high_resolution_clock::time_point t0, tf;
   std::chrono::duration<double> duracion;
   if (argc != 3) {
      cerr << "Uso: " << argv[0] << " semilla tam\n";
      return -1;
   }
   unsigned long int semilla = atoi(argv[1]);
   srand(semilla);
   n = atoi(argv[2]);
   t0 = std::chrono::high_resolution_clock::now(); 

   hanoi(n, 1, 2, 3);

   tf = std::chrono::high_resolution_clock::now(); 

   duracion = std::chrono::duration_cast<std::chrono::duration<double>>(tf - t0);
   cout << n << " " << duracion.count() << endl;

   return 0;
}
