//
//  PlayerInfo.m
//  CardGame
//
//  Created by Rafagan Abreu on 01/02/14.
//  Copyright (c) 2014 Rafagan Abreu. All rights reserved.
//

#import "PlayerInfo.h"

@implementation PlayerInfo

+(instancetype)createPlayerWithName:(NSString*)name andScore:(NSUInteger)score
{
    PlayerInfo* player = [PlayerInfo new];
    player.nickname = [[name substringToIndex:3] uppercaseString];
    player.score = score;
    
    return player;
}

+ (instancetype)createPlayerWithString:(NSString *)data
{
    PlayerInfo* player = [PlayerInfo new];
    NSArray* values = [data componentsSeparatedByString:@" "];
    
    player.nickname = [[(NSString*)values[1] substringToIndex:3] uppercaseString];
    player.score = ((NSString*)values[0]).integerValue;
    
    return player;
}

- (NSString *)getInfoAsString
{
    return [NSString stringWithFormat:@"%lu %@",(unsigned long)_score,_nickname];
}

- (NSString *)description
{
    return [self getInfoAsString];
}

@end
