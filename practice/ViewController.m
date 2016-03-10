//
//  ViewController.m
//  practice
//
//  Created by alexandra blumenfeld on 3/7/16.
//  Copyright © 2016 alexandra blumenfeld. All rights reserved.
//

#import "ViewController.h"

//importing the FactBook header file so we can have acces to their properties
#import "FactBook.h"
#import "ColorWheel.h"

@interface ViewController ()
@property NSArray *players;
@property NSArray *shirts;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //here we are initializing factBook object, self is the ViewController
    
    self.factBook = [[FactBook alloc]init];
    
    //here we are initializing the ColorWhell instance
    
    self.colorWheel = [[ColorWheel alloc] init];
    
    
    //now lets change the background color every time the view loads the view has a property called bakcground color and we can use it
    
    UIColor *randomColor = [self.colorWheel randomColor];
    self.funFactButton.tintColor = randomColor;
    self.view.backgroundColor = randomColor;
    
    
        //Now we have acces to the FactBook data model, here we are initializing the lable with a random fact when the ViewDodload method runs
    
    self.funFactLabel.text = [self.factBook  randomFact];

 
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    
}


- (IBAction)showFunFact {

    //here we are setting the text of the porperty funFactlabel = to [self.factbook that meas this new instance of FactBook in here and sending the randomFact message ] the randomFact message is implemented in the model, this is the controller 
  
    
      UIColor *randomColor = [self.colorWheel randomColor];
      self.funFactButton.tintColor = randomColor;
      self.view.backgroundColor = randomColor;
    
    
      self.funFactLabel.text = [self.factBook randomFact];

    
}




@end

















