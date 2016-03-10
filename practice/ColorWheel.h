//
//  colorWheel.h
//  practice
//
//  Created by alexandra blumenfeld on 3/7/16.
//  Copyright © 2016 alexandra blumenfeld. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



@interface ColorWheel : NSObject

@property (strong, nonatomic) NSArray *colors;

-(UIColor *)randomColor;


@end
