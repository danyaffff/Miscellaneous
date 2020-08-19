//
//  main.cpp
//  task
//
//  Created by Даниил Храповицкий on 19.08.2020.
//

#include <iostream>
#include <fstream>
#include <vector>
#include <regex>

class Exception: public std::exception {
    std::string error;
public:
    Exception(std::string error): error(std::move(error)) {}
    
    const char * what() const noexcept override {
        return error.c_str();
    }
};

int main() {
    std::ifstream fin("Входные данные.txt");
    std::ifstream sin("Слова.txt");
    
    std::regex regular("\\{([*]?)параметр([0-9]{1,})\\}(.*)");
    std::cmatch result;
    
    std::string text;
    std::string word;
    
    int number;
    
    std::vector<std::string> placed;
    
    while (getline(sin, word)) {
        
        placed.push_back(word);
    }
    
    sin.close();
    
    try {
        while (fin >> word) {
            
            if (std::regex_match(word.c_str(), result, regular)) {
                number = stoi(result[2]);

                if (result[1] == "*") {
                    if (placed[number] == "") {
                        throw Exception("Не введен какой-то обязательный параметр!");
                    }
                }
                
                word = placed[number] + std::string(result[3]);
            }
            
            if (word != "") {
                text += word + " ";
            }
        }
    } catch (Exception &exception) {
        std::cerr << exception.what() << std::endl;
        placed.clear();
        fin.close();
        return 1;
    }
    
    placed.clear();
    fin.close();
    
    std::ofstream fout("Выходные данные.txt");
    
    fout << text;
    
    fout.close();
}
