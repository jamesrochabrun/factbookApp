//
//  ViewController.h
//  practice
//
//  Created by alexandra blumenfeld on 3/7/16.
//  Copyright © 2016 alexandra blumenfeld. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CatImage.h"
@class ColorWheel;


@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *funFactLabel;

@property (strong, nonatomic) ColorWheel *colorWheel;
@property CGPoint pos;
@property NSTimer *timer;
@property (weak, nonatomic) IBOutlet CatImage *cat;





@end

