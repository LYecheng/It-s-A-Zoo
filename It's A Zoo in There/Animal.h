
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Animal : NSObject

@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *species;
@property (nonatomic,strong) NSNumber *age;
@property (nonatomic,strong) UIImage *image;
@property (nonatomic,strong) NSString *soundPath;

//overide description
- (void)description;

@end
