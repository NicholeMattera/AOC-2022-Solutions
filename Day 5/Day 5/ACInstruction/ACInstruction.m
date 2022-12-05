#import "ACInstruction.h"

@implementation ACInstruction

- (nullable instancetype)initWithString:(NSString *)instruction {
    self = [super init];
    if (self) {
        NSArray * components = [instruction componentsSeparatedByString:@" "];
        
        self.numberOfCargo = [[components objectAtIndex:1] integerValue];
        self.fromStackIndex = [[components objectAtIndex:3] integerValue] - 1;
        self.toStackIndex = [[components objectAtIndex:5] integerValue] - 1;
    }
    
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"move %d from %d to %d", (int) self.numberOfCargo, (int) self.fromStackIndex, (int) self.toStackIndex];
}

@end
