//
//  ViewController.h
//  practice
//
//  Created by alexandra blumenfeld on 3/7/16.
//  Copyright © 2016 alexandra blumenfeld. All rights reserved.
//

#import <UIKit/UIKit.h>


//adding a class or forward declaration
@class FactBook;
@class ColorWheel;


@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *funFactLabel;

//here we set the Factbook class as a property and create a new instance of FactBook
@property (strong, nonatomic) FactBook *factBook;
@property (strong, nonatomic) ColorWheel *colorWheel;
@property (weak, nonatomic) IBOutlet UIButton *funFactButton;



@end

