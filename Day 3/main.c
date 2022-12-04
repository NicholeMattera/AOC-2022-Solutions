#include <stdbool.h>
#include <stdio.h>
#include <string.h>

bool isItemInvalid(char item) {
    return item < 'A' || (item > 'Z' && item < 'a') || item > 'z';
}

size_t getItemIndex(char item) {
    return item - 'A';
}

int getItemPriority(char item) {
    if (item >= 'a' && item <= 'z') {
        return item - 'a' + 1;
    } else if (item >= 'A' && item <= 'Z') {
        return item - 'A' + 27;
    }

    return 0;
}

void partOne(FILE * file) {
    int sumOfPriorities = 0;
    char rucksack[50] = {0};
    while (fgets(rucksack, 50, file) != NULL) {
        bool compartmentOneItems[60] = {0};

        for (int i = 0; i < strlen(rucksack) / 2; i++) {
            if (isItemInvalid(rucksack[i])) {
                continue;
            }

            compartmentOneItems[getItemIndex(rucksack[i])] = true;
        }

        for (int i = strlen(rucksack) / 2; i < strlen(rucksack); i++) {
            if (isItemInvalid(rucksack[i])) {
                continue;
            }

            if (compartmentOneItems[getItemIndex(rucksack[i])]) {
                sumOfPriorities += getItemPriority(rucksack[i]);
                break;
            }
        }
    }

    printf("Part 1: %d\n", sumOfPriorities);
}

void partTwo(FILE * file) {    
    int sumOfPriorities = 0;
    char rucksack[50] = {0};
    bool groupRucksackItems[2][60] = {0};
    int rucksackIndex = 0;
    while (fgets(rucksack, 50, file) != NULL) {
        int groupRucksackIndex = rucksackIndex % 3;
        
        if (groupRucksackIndex < 2) {
            for (int i = 0; i < strlen(rucksack); i++) {
                if (isItemInvalid(rucksack[i])) {
                    continue;
                }

                groupRucksackItems[groupRucksackIndex][getItemIndex(rucksack[i])] = true;
            }
        } else {
            for (int i = 0; i < strlen(rucksack); i++) {
                if (isItemInvalid(rucksack[i])) {
                    continue;
                }

                if (groupRucksackItems[0][getItemIndex(rucksack[i])] && groupRucksackItems[1][getItemIndex(rucksack[i])]) {
                    sumOfPriorities += getItemPriority(rucksack[i]);
                    break;
                }
            }

            for (int x = 0; x < 2; x++) {
                for (int y = 0; y < 60; y++) {
                    groupRucksackItems[x][y] = false;
                }
            }
        }
        
        rucksackIndex++;
    }

    printf("Part 2: %d\n", sumOfPriorities);
}

int main() {
    FILE * file = fopen("./input", "r");
    if (file == NULL) {
        printf("Error opening file\n");
        return 1;
    }

    partOne(file);
    fseek(file, 0, SEEK_SET);
    partTwo(file);

    fclose(file);
    
    return 0;
}
