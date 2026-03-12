#include <iostream>
#include <chrono>
#include <cstdlib>

using namespace std;

long long fibonacci(int n) {
    if (n <= 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
}

int main(int argc, char *argv[]) {
    int n;
    std::chrono::high_resolution_clock::time_point t0, tf;
    std::chrono::duration<double> duracion;

    if (argc != 2) {
        cerr << "Uso: " << argv[0] << " tam\n";
        return -1;
    }

    n = atoi(argv[1]);
    t0 = std::chrono::high_resolution_clock::now(); 
    long long res = fibonacci(n); 
    tf = std::chrono::high_resolution_clock::now(); 
    duracion = std::chrono::duration_cast<std::chrono::duration<double>>(tf - t0);
    cout << n << " " << duracion.count() << endl;

    return 0;
}
