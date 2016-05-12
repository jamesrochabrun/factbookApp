//
//  colorWheel.m
//  practice
//
//  Created by alexandra blumenfeld on 3/7/16.
//  Copyright © 2016 alexandra blumenfeld. All rights reserved.
//

#import "colorWheel.h"

@implementation ColorWheel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.colors= [[NSArray alloc] initWithObjects:
                      [UIColor colorWithRed:1.000 green:0.404 blue:0.400 alpha:1.000],
                      [UIColor colorWithRed: 22/255.0 green:187/255.0 blue: 181/255.0 alpha:1.0  ],
                      [UIColor colorWithRed:0.969 green:0.612 blue:0.012 alpha:1.000],
                      [UIColor colorWithRed:0.949 green:0.302 blue:0.204 alpha:1.000],
                      [UIColor colorWithRed:0.592 green:0.808 blue:0.408 alpha:1.000],
                      [UIColor colorWithRed:0.012 green:0.396 blue:0.549 alpha:1.000],
                      [UIColor colorWithRed: 85/255.0 green:187/255.0 blue: 181/255.0 alpha:1.0 ],
                      [UIColor colorWithRed:0.953 green:0.773 blue:0.000 alpha:1.000],
                      [UIColor colorWithRed:0.125 green:0.808 blue:0.427 alpha:1.000],
                      [UIColor colorWithRed:0.008 green:0.659 blue:0.957 alpha:1.000],
                      [UIColor colorWithRed: 85/255.0 green:187/255.0 blue: 181/255.0 alpha:1.0 ],
                      [UIColor colorWithRed:0.616 green:0.369 blue:0.710 alpha:1.000],
                      [UIColor colorWithRed:0.082 green:0.780 blue:0.694 alpha:1.000],
                      [UIColor colorWithRed:0.827 green:0.329 blue:0.000 alpha:1.000],
                      [UIColor colorWithRed:0.984 green:0.478 blue:0.325 alpha:1.000],
                      [UIColor colorWithRed:0.255 green:0.361 blue:0.443 alpha:1.000],
                      [UIColor colorWithRed:0.827 green:0.192 blue:0.180 alpha:1.000],
                      [UIColor colorWithRed:1.000 green:0.659 blue:0.000 alpha:1.000],
                      nil];
    }
    return self;
}

-(UIColor *)randomColor {
    int randomint = arc4random_uniform((int)self.colors.count);
    return [self.colors objectAtIndex:randomint];
}

@end
