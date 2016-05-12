//
//  CatImage.h
//  practice
//
//  Created by James Rochabrun on 11-05-16.
//  Copyright © 2016 alexandra blumenfeld. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CatImageDelegate
@optional
-(void)didTapImage;



@end

@interface CatImage : UIImageView
@property id<CatImageDelegate>delegate;
-(instancetype)initWithCoder:(NSCoder *)aDecoder;


@end
