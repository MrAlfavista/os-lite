#include <iostream>
#include <iomanip>
#include <stdlib.h>

enum {
    NUM_ITERS = 200000000
};

double cos(double x) {
    double res = 1;
    double term = 1;
    for (int i = 1; i < NUM_ITERS; i++) {
        term *= (-1) * x * x / (i * 2) / (i * 2 - 1);
        res += term;
    }
    return res;
}

int main() {
	double x;
	std::cin >> x;
    std::cout << std::fixed << std::setprecision(15) << cos(x) << std::endl;
    return 0;
}
