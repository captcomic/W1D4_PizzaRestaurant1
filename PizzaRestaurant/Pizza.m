//
//  Pizza.m
//  PizzaRestaurant
//
//  Created by Fariha on 6/7/18.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "Pizza.h"

@implementation Pizza

- (PizzaSize)size {
    return _size;
}

- (NSArray *)toppings {
    return _toppings;
}

- (instancetype)initWithSize:(PizzaSize)size toppings:(NSArray *)toppings {
    if (self = [super init]) {
        _size = size;
        _toppings = toppings;
    }
    return self; 
}

+ (Pizza *)largePepperoni {
    return [[Pizza alloc] initWithSize:PizzaSizeLarge toppings:@[@"pepperoni"]];
}

+ (Pizza *)meatLoversWithSize:(PizzaSize)size {
    return [[Pizza alloc] initWithSize:size toppings:@[@"pepperoni", @"sausage", @"ham", @"bacon", @"cheese"]];
}


@end
