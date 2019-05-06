//
//  CardMatchingGame.m
//  CardGame
//
//  Created by Rafagan Abreu on 31/01/14.
//  Copyright (c) 2014 Rafagan Abreu. All rights reserved.
//

#import "CardMatchingGame.h"
#import "DataSource.h"

@interface CardMatchingGame ()
//Versão para escrita
@property (nonatomic,readwrite) NSInteger score;
@property (nonatomic,strong) NSMutableArray *cards;
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if(!_cards) _cards = [NSMutableArray new];
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck: (Deck*)deck
{
    self = [super init];
    if(self) {
        for(int i=0;i<count;i++) {
            Card* card = [deck drawRandomCard];
            
            if(card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    
    return self;
}

static const int MATCH_BONUS = 10;

- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card* card = [self cardAtIndex:index];
    int difficult = ((NSString*)[DATA_SRC.settings objectForKey:@"difficult_preference"]).intValue;
    
    int mismatchPenality = 0,costToChoose = 0;
    switch (difficult) {
        case 2:
            mismatchPenality = 1;
        case 1:
            costToChoose = 1;
            break;
    }
    
    if(card.isMatched) return;
    
    if(card.isChosen) {
        card.chosen = NO;
    } else {
        //match against another card
        for(Card* otherCard in self.cards) {
            if (otherCard.isChosen && !otherCard.isMatched) {
                int matchScore = [card match:@[otherCard]];
                if(matchScore) {
                    self.score += matchScore * MATCH_BONUS;
                    card.matched = YES;
                    otherCard.matched = YES;
                } else {
                    self.score -= mismatchPenality;
                    otherCard.chosen = NO;
                }
                break;
            }
        }
        self.score -= costToChoose;
        card.chosen = YES;
    }
}

- (Card*)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

@end
