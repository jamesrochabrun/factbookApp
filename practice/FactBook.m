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

- (instancetype)initWithFact:(NSString *)fact
{
    self = [super init];
    if (self) {
        self.fact = fact;
    }
    
    return self;
}



@end
