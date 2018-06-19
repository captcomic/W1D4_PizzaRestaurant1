//
//  Kitchen.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "Kitchen.h"

@implementation Kitchen

- (Pizza *)makePizzaWithSize:(PizzaSize)size toppings:(NSArray *)toppings {

    if ((toppings.count == 1) && [toppings[0] isEqualToString:@"meatlovers"]) {
        return [Pizza meatLoversWithSize:size];
    } else {
        return [[Pizza alloc] initWithSize:size toppings:toppings];
    } 
}

@end
