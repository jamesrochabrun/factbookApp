//
//  CatImage.m
//  practice
//
//  Created by James Rochabrun on 11-05-16.
//  Copyright © 2016 alexandra blumenfeld. All rights reserved.
//


#import "CatImage.h"

@interface CatImage()<UIGestureRecognizerDelegate>

@end

@implementation CatImage
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self){
        self =[super initWithCoder:aDecoder];
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tappedGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        self.gestureRecognizers = @[tappedGesture];
        for (UIGestureRecognizer *recognizer in self.gestureRecognizers) {
            recognizer.delegate = self;
        }
    }
    return self;
}

-(void)handleTap:(UITapGestureRecognizer *)gestureRecognizer {
    
    if (gestureRecognizer.state == UIGestureRecognizerStateRecognized ||
        gestureRecognizer.state == UIGestureRecognizerStateBegan) {

        [self.delegate didTapImage];
    }
}






@end
