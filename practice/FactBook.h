//
//  FactBook.h
//  practice
//
//  Created by alexandra blumenfeld on 3/7/16.
//  Copyright © 2016 alexandra blumenfeld. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FactBook : NSObject
@property NSString *fact;
- (instancetype)initWithFact:(NSString *)fact;

@end
