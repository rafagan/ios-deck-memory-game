//
//  GameMusic.m
//  QuizObjectiveC
//
//  Created by Rafagan on 01/11/13.
//  Copyright (c) 2013 Rafagan Abreu. All rights reserved.
//

#import "GameMusic.h"

@implementation GameMusic
@synthesize me;

- (instancetype)initWithMusicName:(NSString *)name andVolume:(float)volume
{
    self = [super init];
    if (self) {
        NSError *error;
        NSString *musicName = [[NSBundle mainBundle] pathForResource:name ofType:@"mp3"];
        NSURL *urlPath = [NSURL fileURLWithPath:musicName];
        me = [[AVAudioPlayer alloc] initWithContentsOfURL:urlPath error:&error];
        [me setVolume:volume];
        [me setNumberOfLoops:-1];
        [me prepareToPlay];
    }
    return self;
}

- (void)play
{
    [me play];
}

- (void)setVolume:(float)volume
{
    [me setVolume:volume];
}

@end
