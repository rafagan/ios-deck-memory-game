//
//  PlayerInfo.h
//  CardGame
//
//  Created by Rafagan Abreu on 01/02/14.
//  Copyright (c) 2014 Rafagan Abreu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlayerInfo : NSObject

@property (nonatomic,strong) NSString* nickname;
@property (nonatomic) NSUInteger score;

+(instancetype)createPlayerWithName:(NSString*)name andScore:(NSUInteger)score;
+(instancetype)createPlayerWithString:(NSString*)data;
-(NSString*)getInfoAsString;

@end
