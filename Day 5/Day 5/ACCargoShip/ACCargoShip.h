#import <Foundation/Foundation.h>
#import "../ACStack/ACStack.h"

NS_ASSUME_NONNULL_BEGIN

@interface ACCargoShip : NSObject <NSCopying>

- (nullable instancetype)initWithInputLines:(NSArray *)inputLines;

- (NSString *)description;

- (ACStack *)getStack:(NSUInteger)index;
- (NSString *)getTopCrateMarkings;
- (NSUInteger)getLargestStackHeight;

@property (nonatomic) NSUInteger numberOfStacks;

@end

NS_ASSUME_NONNULL_END
