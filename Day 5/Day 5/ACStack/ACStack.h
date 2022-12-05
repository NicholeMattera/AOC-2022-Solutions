#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ACStack : NSObject

- (nullable instancetype)initWithCapacity:(NSInteger)capacity;

- (NSString *)description;

- (void)populateStackWithCrate:(NSString *)crate;
- (void)addCrate:(NSString *)crate;

- (NSString *)getCrate;
- (NSString *)getTopCrateMarking;
- (NSUInteger)getHeight;

@end

NS_ASSUME_NONNULL_END
