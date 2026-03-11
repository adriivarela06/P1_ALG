#include <cstdlib>
#include <chrono>
#include <iostream>

using namespace std;

void seleccion(int *v,int n);

int main(int argc, char *argv[]) {

        int *v;

        int n,i;

        std::chrono::high_resolution_clock::time_point t0, tf;

        std::chrono::duration<double> duracion;


        if (argc != 3) {

                cerr << "Uso: " << argv[0] << " semilla tam\n";

                return -1;

        }

       unsigned long int semilla;

        semilla = atoi(argv[1]);

        srand(semilla); // Inicializamos generador de no. aleatorios


        n= atoi(argv[2]);

        v= new int[n];


        // Generamos vector aleatorio de prueba, con componentes entre 0 y n-1

        for (i= 0; i<n; i++)

                v[i]= rand()%n;


        t0= std::chrono::high_resolution_clock::now(); // Cogemos el tiempo en >

        seleccion(v, n); 

        tf= std::chrono::high_resolution_clock::now(); // Cogemos el tiempo en >


        duracion = std::chrono::duration_cast<std::chrono::duration<double>>(tf - t0);

        cout << n << " " << duracion.count() << endl;


        delete [] v;

        return 0;

}

void seleccion(int *v ,int n){
         for(int i = 0; i < n - 1;++i){
                int min = i ;
                for(int j = i + 1;j < n;++j){
                        if (v[j] < v [min])
                                min = j;
                }
                int aux = v[i];
                v[i] = v[min];
                v[min] = aux;
        }
}
