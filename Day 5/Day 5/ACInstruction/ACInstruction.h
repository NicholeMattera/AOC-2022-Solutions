#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ACInstruction : NSObject

- (nullable instancetype)initWithString:(NSString *)instruction;

- (NSString *)description;

@property (nonatomic) NSUInteger fromStackIndex;
@property (nonatomic) NSUInteger toStackIndex;

@property (nonatomic) NSUInteger numberOfCargo;

@end

NS_ASSUME_NONNULL_END
