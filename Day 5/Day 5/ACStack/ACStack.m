#import "ACStack.h"

@interface ACStack ()

@property (nonatomic, strong) NSMutableArray<NSString *> * cargo;

@end

@implementation ACStack

@synthesize cargo;

- (nullable instancetype)initWithCapacity:(NSInteger)capacity {
    self = [super init];
    if (self) {
        self.cargo = [NSMutableArray arrayWithCapacity:capacity];
    }
    
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"['%@']", [self.cargo componentsJoinedByString:@"','"]];
}

- (void)populateStackWithCrate:(NSString *)crate {
    [self.cargo addObject:crate];
}

- (void)addCrate:(NSString *)crate {
    [self.cargo insertObject:crate atIndex:0];
}

- (NSString *)getCrate {
    NSString * crate = [self.cargo firstObject];
    [self.cargo removeObjectAtIndex:0];
    
    return crate;
}

- (NSString *)getTopCrateMarking {
    return [self.cargo firstObject];
}

- (NSUInteger)getHeight {
    return self.cargo.count;
}

@end
