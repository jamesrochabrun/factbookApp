//
//  FactBook.m
//  practice
//
//  Created by alexandra blumenfeld on 3/7/16.
//  Copyright © 2016 alexandra blumenfeld. All rights reserved.
//

#import "FactBook.h"

@implementation FactBook


//initializing by default with instance variable _facts...

- (instancetype)init
{
    self = [super init];
    if (self) {
        
            NSString *urlString = @"http://catfacts-api.appspot.com/api/facts?number=100";
            NSURL *url = [NSURL URLWithString:urlString];
            NSURLSession *session = [NSURLSession sharedSession];
            NSURLSessionTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                
                NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
                
                self.facts = [NSMutableArray new];
                self.facts = dictionary[@"facts"];
            }];
            [task resume];
        }
    
    return self;
}

//creating the method for the randomFact,  we need to put (int)self.facts.count , (int) goes first becuase a issue with 32 and 64 bytes , we are casting the value int here BTW

-(NSString *)randomFact {
    int randomInt = arc4random_uniform((int)self.facts.count);
    return [self.facts objectAtIndex:randomInt];
}

@end
