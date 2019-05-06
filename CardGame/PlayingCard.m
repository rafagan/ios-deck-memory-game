//
//  PlayingCard.m
//  CardGame
//
//  Created by Rafagan Abreu on 30/01/14.
//  Copyright (c) 2014 Rafagan Abreu. All rights reserved.
//

#import "PlayingCard.h"
#import "DataSource.h"

@implementation PlayingCard

//Because we provide setter and getter
@synthesize suit = _suit;

+ (NSArray*)validSuits
{
    return @[@"♥",@"♦",@"♠",@"♣"];
}

+ (NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger)maxRank
{
    return [self rankStrings].count;
}

- (NSString*)contents
{
    NSArray* rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
    
}

- (void)setSuit:(NSString *)suit
{
    if([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (void)setRank:(NSUInteger)rank
{
    if(rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    int difficult = ((NSString*)[DATA_SRC.settings objectForKey:@"difficult_preference"]).intValue + 1;
    
    if([otherCards count] == 1) {
        //FirstObject previne que seu programa quebre, pois retorna nil caso a lista esteja vazia
        id card = [otherCards firstObject];
        
        if(![card isKindOfClass:[PlayingCard class]]) //INSTROSPECTION
            return score;
        
        PlayingCard* otherCard = (PlayingCard*)card;
        if([self.suit isEqualToString:otherCard.suit]) {
            score = difficult;
        } else if(self.rank == otherCard.rank) {
            score = 4 * difficult;
        }
    }
    
    return score;
}

@end
