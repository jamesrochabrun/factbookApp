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
                [UIColor colorWithRed: 90/255.0 green:187/255.0 blue: 181/255.0 alpha:1.0  ],
                [UIColor colorWithRed: 22/255.0 green:187/255.0 blue: 181/255.0 alpha:1.0  ],
                [UIColor colorWithRed: 222/255.0 green:187/255.0 blue: 181/255.0 alpha:1.0  ],
                [UIColor colorWithRed: 45/255.0 green:187/255.0 blue: 181/255.0 alpha:1.0  ],
                [UIColor colorWithRed: 654/255.0 green:187/255.0 blue: 181/255.0 alpha:1.0  ],
                [UIColor colorWithRed: 105/255.0 green:187/255.0 blue: 181/255.0 alpha:1.0  ],
                [UIColor colorWithRed: 85/255.0 green:187/255.0 blue: 181/255.0 alpha:1.0 ], nil];
    }
    return self;
}


-(UIColor *)randomColor {
    int randomint = arc4random_uniform((int)self.colors.count);
    return [self.colors objectAtIndex:randomint];
}

@end
