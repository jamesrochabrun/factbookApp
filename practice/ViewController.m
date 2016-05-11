//
//  ViewController.m
//  practice
//
//  Created by alexandra blumenfeld on 3/7/16.
//  Copyright © 2016 alexandra blumenfeld. All rights reserved.
//

#import "ViewController.h"

#import "FactBook.h"
#import "ColorWheel.h"

@interface ViewController ()
@property NSArray *facts;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.colorWheel = [[ColorWheel alloc] init];
    UIColor *randomColor = [self.colorWheel randomColor];
    self.funFactButton.tintColor = randomColor;
    self.view.backgroundColor = randomColor;
    [self getJson];
}

- (void)getJson {
    NSString *urlString = @"http://catfacts-api.appspot.com/api/facts?number=100";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        
        self.facts = [NSMutableArray new];
        self.facts = dictionary[@"facts"];
        
        dispatch_async(dispatch_get_main_queue(), ^(void){
            //Run UI Updates
            for (NSString *fact in self.facts) {
                FactBook *factBook  = [[FactBook alloc]initWithFact:fact];
                self.funFactLabel.text = factBook.fact;
            }
        });
    }];
    [task resume];
}


- (IBAction)showFunFact {
    
    UIColor *randomColor = [self.colorWheel randomColor];
    self.funFactButton.tintColor = randomColor;
    self.view.backgroundColor = randomColor;
    int randomInt = arc4random_uniform((int)self.facts.count);
    self.funFactLabel.text = [self.facts objectAtIndex:randomInt];
}




@end

















