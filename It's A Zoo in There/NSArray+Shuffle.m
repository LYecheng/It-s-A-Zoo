
#import "NSArray+Shuffle.h"

@implementation NSArray (ShuffleCategory)

- (NSMutableArray *)shuffle {

    NSMutableArray *tmp = [NSMutableArray arrayWithCapacity:[self count]];
    
    for (id anObject in self) {
        NSUInteger random = arc4random()%([tmp count]+1);
        [tmp insertObject:anObject atIndex: random];
    }
    return [NSMutableArray arrayWithArray:tmp];
}

@end
