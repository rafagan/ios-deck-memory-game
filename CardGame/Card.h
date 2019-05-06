//
//  Card.h
//  CardGame
//
//  Created by Rafagan Abreu on 30/01/14.
//  Copyright (c) 2014 Rafagan Abreu. All rights reserved.
//

//Jeito Objective-C de importação
@import Foundation;

@interface Card : NSObject

@property (strong) NSString* contents;
@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;

- (int) match:(NSArray*)otherCards;

@end
