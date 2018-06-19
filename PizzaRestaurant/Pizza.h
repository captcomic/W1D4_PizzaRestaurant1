//
//  Pizza.h
//  PizzaRestaurant
//
//  Created by Fariha on 6/7/18.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, PizzaSize) {
    PizzaSizeSmall,
    PizzaSizeMedium,
    PizzaSizeLarge,
};

/*
typedef enum {
    small,
    medium,
    large
} PizzaSize;
*/
 
@interface Pizza : NSObject
{
    PizzaSize _size;
    NSArray *_toppings;
}

- (PizzaSize)size;
- (NSArray *)toppings;

- (instancetype)initWithSize:(PizzaSize)size toppings:(NSArray *)toppings;

+ (Pizza *)largePepperoni;
+ (Pizza *)meatLoversWithSize:(PizzaSize)size;

@end
