//
//  GameMusic.h
//  QuizObjectiveC
//
//  Created by Rafagan on 01/11/13.
//  Copyright (c) 2013 Rafagan Abreu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface GameMusic : NSObject

@property (nonatomic,strong) AVAudioPlayer *me;

//Designated Initializer
- (instancetype)initWithMusicName:(NSString*)name andVolume:(float)volume;
- (void)play;
- (void)setVolume:(float)volume;


@end
