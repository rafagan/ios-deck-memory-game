//
//  CardMatchingGame.h
//  CardGame
//
//  Created by Rafagan Abreu on 31/01/14.
//  Copyright (c) 2014 Rafagan Abreu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

//Designated Initializer
- (instancetype)initWithCardCount:(NSUInteger)count usingDeck: (Deck*)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card*)cardAtIndex:(NSUInteger)index;

//Versão Somente Leitura
@property (nonatomic,readonly) NSInteger score;

@end
