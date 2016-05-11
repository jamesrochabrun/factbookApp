//
//  Fact+CoreDataProperties.h
//  practice
//
//  Created by James Rochabrun on 11-05-16.
//  Copyright © 2016 alexandra blumenfeld. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Fact.h"

NS_ASSUME_NONNULL_BEGIN

@interface Fact (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *factText;

@end

NS_ASSUME_NONNULL_END
