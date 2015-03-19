
#import "Animal.h"

@implementation Animal

// override description
- (void)description{
    NSLog(@"Animal Object: name=%@, species=%@, age=%@, image=%@", self.name, self.species, self.age, self.image);
}

@end
