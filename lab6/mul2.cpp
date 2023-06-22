#include <iostream>
#include <string>
#include <fstream>

int main(int argc, char **argv) {
	std::fstream fin(std::string(argv[2]), std::fstream::in);
	std::fstream fout(std::string(argv[2]), std::fstream::app);
	for (int i = 0; i < std::stoi(argv[1]); i++) {
		int num;
		fin >> num;
		fout << num * 2 << "\n";
	}
	return 0;
}
