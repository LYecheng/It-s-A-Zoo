
#import <UIKit/UIKit.h>
#import "Animal.h"
#import "NSArray+Shuffle.h"
@import AVFoundation;

@interface ViewController : UIViewController <UIScrollViewDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *animalScrollView;

@property (weak, nonatomic) IBOutlet UILabel *animalLabel;

@property (nonatomic) AVAudioPlayer* audioPlayer;

@property (nonatomic,strong) NSMutableArray *animals;

-(IBAction)buttonTapped:(id)sender;

@end

