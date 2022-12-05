#import <Foundation/Foundation.h>
#import "ACCargoShip/ACCargoShip.h"
#import "ACInstruction/ACInstruction.h"
#import "ACStack/ACStack.h"

void partOne(ACCargoShip * cargoShip, NSArray * instructions) {
    for (ACInstruction * instruction in instructions) {
        ACStack * fromStack = [cargoShip getStack:instruction.fromStackIndex];
        ACStack * toStack = [cargoShip getStack:instruction.toStackIndex];
        
        for (NSInteger i = 0; i < instruction.numberOfCargo; i++) {
            [toStack addCrate:[fromStack getCrate]];
        }
    }
    
    NSLog(@"Part 1: %@", [cargoShip getTopCrateMarkings]);
}

void partTwo(ACCargoShip * cargoShip, NSArray * instructions) {
    for (ACInstruction * instruction in instructions) {
        ACStack * fromStack = [cargoShip getStack:instruction.fromStackIndex];
        ACStack * toStack = [cargoShip getStack:instruction.toStackIndex];

        NSMutableArray<NSString *> * crates = [NSMutableArray arrayWithCapacity:instruction.numberOfCargo];
        for (NSInteger i = 0; i < instruction.numberOfCargo; i++) {
            [crates addObject:[fromStack getCrate]];
        }
        
        for (NSString * crate in [crates reverseObjectEnumerator]) {
            [toStack addCrate:crate];
        }
    }
    
    NSLog(@"Part 2: %@", [cargoShip getTopCrateMarkings]);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        if (![[NSFileManager defaultManager] fileExistsAtPath:@"./input"]) {
            NSLog(@"Input file does not exists");
            return 1;
        }
        
        NSError * error;
        NSString * input = [NSString stringWithContentsOfFile:@"./input" encoding:NSASCIIStringEncoding error:&error];
        if (error) {
            NSLog(@"Error opening file: %@", error.localizedDescription);
            return 1;
        }
        
        NSArray * inputLines = [input componentsSeparatedByString:@"\n"];
        
        ACCargoShip * cargoShip = [[ACCargoShip alloc] initWithInputLines:inputLines];
        
        // Parse Instructions
        NSMutableArray * instructions = [NSMutableArray arrayWithCapacity:[inputLines count] - ([cargoShip getLargestStackHeight] + 2)];
        bool foundInstructions = false;
        for (NSString * inputLine in inputLines) {
            if (!foundInstructions) {
                foundInstructions = [inputLine isEqualToString:@""];
                continue;
            }
            
            if ([inputLine isEqualToString:@""]) {
                continue;
            }
            
            [instructions addObject:[[ACInstruction alloc] initWithString:inputLine]];
        }

        partOne(cargoShip, instructions);
        
        cargoShip = [[ACCargoShip alloc] initWithInputLines:inputLines];
        partTwo(cargoShip, instructions);
    }

    return 0;
}
