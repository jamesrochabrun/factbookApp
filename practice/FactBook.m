//
//  FactBook.m
//  practice
//
//  Created by alexandra blumenfeld on 3/7/16.
//  Copyright © 2016 alexandra blumenfeld. All rights reserved.
//

#import "FactBook.h"

@implementation FactBook


//initializing by default with instance variable _facts...

- (instancetype)init
{
    self = [super init];
    if (self) {
        _facts = [[NSArray alloc] initWithObjects:
                  @"Banging your head against a wall burns 150 calories an hour.",
                  @"When hippos are upset, their sweat turns red",
                  @"“Facebook Addiction Disorder” is a mental disorder identified by Psychologists",
                  @"The average woman uses her height in lipstick every 5 years",
                  @"If you lift a kangaroo’s tail off the ground it can’t hop.",
                  @"During your lifetime, you will produce enough saliva to fill two swimming pools.",
                  @"Hyphephilia are people who get aroused by touching fabrics.",
                  @"Between 25% and 33% of the population sneeze when exposed to light.",
                  @"The most common name in world is Muhammad.",
                  @"Mount Olympus Mons on Mars is three times the size of Mount Everest.",
                  @"Each month, there is at least one report of UFOs from each province of Canada.",
                  @"You can be fined up to $1,000 for whistling on Sunday in Salt Lake City, Utah.",
                  @"There are more plastic flamingos in the U.S that there are real ones.",
                  @"More people speak English in China than the United States.",
                  @"A normal raindrop falls at about 7 miles per hour.",
                  @"The only domestic animal not mentioned in the Bible is the cat.",
                  @"A duck’s quack doesn’t echo, and no one knows why.",
                  @"There are no clocks in Las Vegas gambling casinos.",
                  @"During his entire life, Vincent Van Gogh sold exactly one painting, “Red Vineyard at Arles”.",
                  @"The average person falls asleep in seven minutes.",
                  @"There are more plastic flamingos in the U.S that there are real ones.",
                  @"Chewing gum while peeling onions will keep you from crying.",
                  @"In space, astronauts are unable to cry, because there is no gravity and the tears won’t flow.",
                  @"There is a town in Newfoundland, Canada called Dildo.",
                  nil];
    }
    return self;
}

//creating the method for the randomFact,  we need to put (int)self.facts.count , (int) goes first becuase a issue with 32 and 64 bytes , we are casting the value int here BTW

-(NSString *)randomFact {
    int randomInt = arc4random_uniform((int)self.facts.count);
    return [self.facts objectAtIndex:randomInt];
}

@end
