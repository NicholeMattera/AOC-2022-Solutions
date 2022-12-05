#import "ACCargoShip.h"

@interface ACCargoShip ()

@property (nonatomic, strong) NSMutableArray<ACStack *> * stacks;

@end

@implementation ACCargoShip

@synthesize stacks;

- (nullable instancetype)initWithInputLines:(NSArray *)inputLines {
    self = [super init];
    if (self) {
        NSInteger cargoStackStartIndex = 0;
        
        // Initialize the stacks
        for (NSString * inputLine in inputLines) {
            if (![inputLine hasPrefix:@" 1 "]) {
                cargoStackStartIndex++;
                continue;
            }
            
            NSArray * stackNumber = [inputLine componentsSeparatedByString:@"   "];
            self.numberOfStacks = [[stackNumber lastObject] integerValue];
            
            break;
        }
        
        // Populate the stacks
        self.stacks = [NSMutableArray arrayWithCapacity:self.numberOfStacks];
        for (NSInteger stackIndex = 0; stackIndex < self.numberOfStacks; stackIndex++) {
            [self.stacks addObject:[[ACStack alloc] initWithCapacity:cargoStackStartIndex - 1]];

            for (NSInteger lineIndex = 0; lineIndex < cargoStackStartIndex; lineIndex++) {
                NSString * crates = [inputLines objectAtIndex:lineIndex];

                NSString * crate = [crates substringWithRange:NSMakeRange(stackIndex * 3 + stackIndex, 3)];
                if ([crate isEqualToString:@"   "]) {
                    continue;
                }

                NSString * marking = [crate substringWithRange:NSMakeRange(1, 1)];
                [[self.stacks objectAtIndex:stackIndex] populateStackWithCrate:marking];
            }
        }
    }
    
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    ACCargoShip * copy = [[ACCargoShip allocWithZone:zone] init];
    copy.stacks = [self.stacks copy];
    
    return copy;
}

- (NSString *)description {
    NSMutableString * description = [NSMutableString stringWithString:@"{\n"];
    NSUInteger cargoIndex = 0;
    for (ACStack * stack in self.stacks) {
        [description appendFormat:@"\t%d: %@,\n", (unsigned int) cargoIndex, [stack description]];
        cargoIndex++;
    }
    [description appendString:@"}"];
    return description;
}

- (ACStack *)getStack:(NSUInteger)index {
    return [self.stacks objectAtIndex:index];
}

- (NSString *)getTopCrateMarkings {
    NSMutableString * topCrates = [NSMutableString string];
    for (ACStack * stack in self.stacks) {
        [topCrates appendString:[stack getTopCrateMarking]];
    }
    
    return topCrates;
}

- (NSUInteger)getLargestStackHeight {
    NSUInteger stackHeight = 0;
    for (ACStack * stack in self.stacks) {
        if (stackHeight < [stack getHeight]) {
            stackHeight = [stack getHeight];
        }
    }
    
    return stackHeight;
}

@end
