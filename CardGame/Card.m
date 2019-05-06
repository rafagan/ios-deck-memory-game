//
//  Card.m
//  CardGame
//
//  Created by Rafagan Abreu on 30/01/14.
//  Copyright (c) 2014 Rafagan Abreu. All rights reserved.
//

#import "Card.h"

@interface  Card()

@end

@implementation Card

//O synthesize pode ser usado para qualquer variável, mas por padrão é usado em _<name>
@synthesize contents = _contents;


- (int)match:(NSArray *)cards
{
    int score = 0;
    
    for (Card* card in cards)
        if([card.contents isEqualToString:self.contents]) {
            score = 1;
            break;
        }
        
    return score;
}

@end
