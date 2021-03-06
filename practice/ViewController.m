
//
//  ViewController.m
//  practice
//
//  Created by alexandra blumenfeld on 3/7/16.
//  Copyright © 2016 alexandra blumenfeld. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "ColorWheel.h"
#import "Fact.h"
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController ()<CatImageDelegate>
@property NSMutableArray *facts;
@property NSManagedObjectContext *moc;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet CatImage *katty;
@property BOOL myBool;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self firstColorView];
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    self.moc = appDelegate.managedObjectContext;
    self.katty.image = [UIImage imageNamed:@"k4"];
    
    [self start];
    self.cat.delegate = self;
    
    [self loadFacts];
    if(self.facts.count < 1){
        [self getJson];
    }
    
    NSLog(@"sqlite dir = \n%@", appDelegate.applicationDocumentsDirectory);
}


- (void)start {

        self.timer = [NSTimer scheduledTimerWithTimeInterval:(0.03) target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
        self.pos = CGPointMake(6.0, 6.0);

}

- (void)onTimer {
    self.cat.center = CGPointMake(self.cat.center.x + self.pos.x, self.cat.center.y + self.pos.y);
    if(self.cat.center.x > self.view.frame.size.width || self.cat.center.x < 0){
        self.pos = CGPointMake((self.pos.x * -1), self.pos.y );
    }
    if(self.cat.center.y > self.view.frame.size.height || self.cat.center.y < 0){
        self.pos = CGPointMake(self.pos.x , (self.pos.y * -1));
    }
    
}


- (void)firstColorView {
    self.colorWheel = [[ColorWheel alloc] init];
    UIColor *randomColor = [self.colorWheel randomColor];
    self.view.backgroundColor = randomColor;

}

- (void)getJson {
    
    NSString *urlString = @"http://catfacts-api.appspot.com/api/facts?number=100";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        NSMutableArray *factsData = [NSMutableArray new];
        factsData = dictionary[@"facts"];
        self.facts = [NSMutableArray new];
        
        for (NSString *factData in factsData) {
            
//            if (![factData isEqualToString:@"Every time you masturbate God kills a kitten. Please, think of the kittens."]){
//                
//                Fact *fact = [NSEntityDescription insertNewObjectForEntityForName:@"Fact" inManagedObjectContext:self.moc];
//                fact.factText = factData;
//                [self.facts addObject:fact];
//                NSLog(@"this is the count %lu" , (unsigned long)self.facts.count);
//            } else{
//                NSLog(@"%@", factData);
//            }
            
                Fact *fact = [NSEntityDescription insertNewObjectForEntityForName:@"Fact" inManagedObjectContext:self.moc];
                fact.factText = factData;
                [self.facts addObject:fact];
        
            
        }
        NSError *mocError;
        if([self.moc save:&mocError]){
        }else{
            NSLog(@"an error has occurred,...%@", error);
        }
        
        dispatch_async(dispatch_get_main_queue(), ^(void){
            //Run UI Updates
            int randomInt = arc4random_uniform((int)self.facts.count);
            Fact *fact = [self.facts objectAtIndex:randomInt];
            self.funFactLabel.text = fact.factText;
        });
        
    }];
    [task resume];
}

- (void)loadFacts {
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Fact"];
    NSError *error;
    self.facts = [[self.moc executeFetchRequest:request error:&error]mutableCopy];
    
    if(error == nil){
    }else{
        NSLog(@"Error: %@", error);
    }
    if (self.facts.count > 0) {
        int randomInt = arc4random_uniform((int)self.facts.count);
        Fact *fact = [self.facts objectAtIndex:randomInt];
        self.funFactLabel.text = fact.factText;
    }
}

//delegate method
- (void)didTapImage {
    
//    self.myBool = !self.myBool;
//    
//    if (self.myBool) {
//        self.katty.image = [UIImage imageNamed:@"katty1"];
//    } else {
//        self.katty.image = [UIImage imageNamed:@"katty2"];
//
//    }
    
    int randomSoundNumber = arc4random() % 4; //random number from 0 to 3
    
    NSString *soundPath;
    
    NSLog(@"random sound number = %i", randomSoundNumber);
    
    switch (randomSoundNumber) {
        case 0:
            self.katty.image = [UIImage imageNamed:@"k1"];
            soundPath = [[NSBundle mainBundle] pathForResource:@"cat1" ofType:@"mp3"];
            break;
        case 1:
            self.katty.image = [UIImage imageNamed:@"k2"];
            soundPath = [[NSBundle mainBundle] pathForResource:@"cat2" ofType:@"mp3"];
            break;
        case 2:
            self.katty.image = [UIImage imageNamed:@"k3"];
            soundPath = [[NSBundle mainBundle] pathForResource:@"cat3" ofType:@"mp3"];
            break;
        case 3:
            self.katty.image = [UIImage imageNamed:@"k4"];
            soundPath = [[NSBundle mainBundle] pathForResource:@"cat4" ofType:@"mp3"];
            break;
            
        default:
            break;
    }
    
    SystemSoundID soundID;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:soundPath], &soundID);
    AudioServicesPlaySystemSound(soundID);
    
    UIColor *randomColor = [self.colorWheel randomColor];
    self.view.backgroundColor = randomColor;
    int randomInt = arc4random_uniform((int)self.facts.count);
    Fact *fact = [self.facts objectAtIndex:randomInt];
    self.funFactLabel.text = fact.factText;
}


- (IBAction)onShareButtonPresssed:(UIButton *)sender {
    
    NSString *shareText = [NSString stringWithFormat:@"%@", self.funFactLabel.text ];
    NSURL *shareLink = [[NSURL alloc] initWithString:@"https://itunes.apple.com/cl/app/cat-runner-facts/id1113727852?l=en&mt=8"];
    
    UIActivityViewController *activityViewController =
    [[UIActivityViewController alloc] initWithActivityItems:@[shareText,shareLink]
                                      applicationActivities:nil];
    
    [activityViewController setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    
    [activityViewController setExcludedActivityTypes:@[UIActivityTypePostToWeibo,
                                                       UIActivityTypeCopyToPasteboard,
                                                       UIActivityTypeMessage]];
    
    dispatch_async(dispatch_get_main_queue(), ^(void){
        [self presentViewController:activityViewController animated:YES completion:nil];
    });
    
}






@end

















