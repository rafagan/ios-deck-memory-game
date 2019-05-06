//
//  DataSource.m
//  CardGame
//
//  Created by Rafagan Abreu on 01/02/14.
//  Copyright (c) 2014 Rafagan Abreu. All rights reserved.
//

#import "DataSource.h"

@implementation DataSource

static DataSource* data;
+ (instancetype)getMe
{
    if (data == nil) {
        data = [DataSource new];
    }
    return data;
}

- (NSUserDefaults *)settings
{
    if(_settings == nil)
        _settings = [NSUserDefaults standardUserDefaults];
    return _settings;
}

- (PropertyListCRUD *)hiScorePList
{
    if(_hiScorePList == nil)
        _hiScorePList = [[PropertyListCRUD alloc] initWithPropertyListName:@"hiScore"];
    return _hiScorePList;
}

@end
