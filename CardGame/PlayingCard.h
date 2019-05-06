//
//  PlayingCard.h
//  CardGame
//
//  Created by Rafagan Abreu on 30/01/14.
//  Copyright (c) 2014 Rafagan Abreu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card

+ (NSArray*)validSuits;
+ (NSUInteger)maxRank;

@property (nonatomic, strong) NSString* suit;
@property (nonatomic) NSUInteger rank;

@end
