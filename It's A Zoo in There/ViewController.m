

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Create a mutable array to store animal objects
    NSMutableArray *animalsArray = [[NSMutableArray alloc] init];
    
    //Add animal: dog
    Animal *dog = [[Animal alloc] init];
    dog.name = @"NiuNiu";
    dog.species = @"Dog";
    dog.age = @3;
    dog.image = [UIImage imageNamed:@"dog.png"];
    dog.soundPath = @"%@/DogSound.wav";
    
    //Add animal: cat
    Animal *cat = [[Animal alloc] init];
    cat.name = @"Alice";
    cat.species = @"Cat";
    cat.age = @2;
    cat.image = [UIImage imageNamed:@"cat.png"];
    cat.soundPath = @"%@/CatSound.wav";
    
    //Add animal: owl
    Animal *owl = [[Animal alloc] init];
    owl.name = @"Ellie";
    owl.species = @"Owl";
    owl.age = @1;
    owl.image = [UIImage imageNamed:@"owl.png"];
    owl.soundPath = @"%@/OwlSound.wav";
    
    [animalsArray addObject: dog];
    [animalsArray addObject: cat];
    [animalsArray addObject: owl];
    self.animals = [animalsArray shuffle];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Referece: http://stackoverflow.com/questions/5272228/detecting-uiscrollview-page-change

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    //Detect page number
    CGFloat fractionalPage = self.animalScrollView.contentOffset.x / 320;
    NSInteger page = lround(fractionalPage);
    
    [UIView animateWithDuration: 0.3 animations:^{self.animalLabel.alpha = 0;}
         completion:^(BOOL finished) {
             self.animalLabel.text = [NSString stringWithFormat:@"%@", [[self.animals objectAtIndex:page] species]];
             [UIView animateWithDuration:0.3 animations:^{self.animalLabel.alpha = 1;}];
          }
     ];
}

- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    [self loadScrollView];
}

- (void) loadScrollView {
    
    [self.animalScrollView setContentSize: CGSizeMake(960, 500)];
    //[self.scrollView pagingEnabled:YES];
    [self.animalLabel setText: [[self.animals objectAtIndex: 0] name]];
    
    UIButton *button;
    UIImageView *imgView;
    
    for (int i = 0; i < 3; i++) {
        
        Animal* thisAnimal =[self.animals objectAtIndex:i];
        
        //image view
        imgView = [[UIImageView alloc] initWithImage: thisAnimal.image];
        [imgView setTag: i];
        [imgView setFrame: CGRectMake(i * 320, 60, 320, 400)];
        [self.animalScrollView addSubview: imgView];
        
        //create and add buttons
        button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setTag: i];
        [button setFrame: CGRectMake(i * 320 + 80, 20, 160, 30)];
        [button setTitle:[NSString stringWithFormat:@"%@", thisAnimal.name] forState:UIControlStateNormal];
        
        //associate a function to the button
        [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.animalScrollView addSubview:button];
    }
}

-(IBAction)buttonTapped:(id)sender {
    UIButton* button = (UIButton*) sender;
    
    Animal* thisAnimal = [self.animals objectAtIndex:button.tag];
    
    NSString* name = thisAnimal.name;
    NSString* content = [NSString stringWithFormat:@"%@ is %@ years old.", name, thisAnimal.age];
    //create alert view
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:name message:content delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    //show the description of the animal on console
    [thisAnimal description];
    
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:[thisAnimal soundPath], [[NSBundle mainBundle] resourcePath]]];
    NSError *error;
    
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    [self.audioPlayer setNumberOfLoops: 1];
    [self.audioPlayer play];
    
    //show alert view
    [alert show];
    }

@end
