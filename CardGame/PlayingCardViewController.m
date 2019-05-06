//
//  PlayingCardViewController.m
//  CardGame
//
//  Created by Rafagan Abreu on 12/02/14.
//  Copyright (c) 2014 Rafagan Abreu. All rights reserved.
//

#import "PlayingCardViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingCardViewController ()

@end

@implementation PlayingCardViewController

- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc]init];
}

@end
