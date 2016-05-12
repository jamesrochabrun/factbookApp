
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

@interface ViewController ()<CatImageDelegate>
@property NSMutableArray *facts;
@property NSManagedObjectContext *moc;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self firstColorView];
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    self.moc = appDelegate.managedObjectContext;
    
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
    self.pos = CGPointMake(3.0, 4.0);
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
    self.funFactButton.tintColor = randomColor;
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
    UIColor *randomColor = [self.colorWheel randomColor];
    self.funFactButton.tintColor = randomColor;
    self.view.backgroundColor = randomColor;
    int randomInt = arc4random_uniform((int)self.facts.count);
    Fact *fact = [self.facts objectAtIndex:randomInt];
    self.funFactLabel.text = fact.factText;

}




@end

















