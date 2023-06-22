#include <iostream>
#include <limits>
#include <string>
#include <stdlib.h>
#include <time.h>

int main(int argc, char **argv) {
	srand(time(0));
	for (int i = 0; i < std::stoi(argv[1]); i++) {
		std::cout << rand() % (std::numeric_limits<int>::max() / 2) << std::endl;
	}
	return 0;
}
