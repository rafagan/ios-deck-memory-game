//
//  DataSource.h
//  CardGame
//
//  Created by Rafagan Abreu on 01/02/14.
//  Copyright (c) 2014 Rafagan Abreu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameMusic.h"
#import "PropertyListCRUD.h"

#define DATA_SRC [DataSource getMe]

@interface DataSource : NSObject

+ (instancetype)getMe;

@property (nonatomic,strong) GameMusic* music;
@property (nonatomic,strong) PropertyListCRUD* hiScorePList;
@property (nonatomic,strong) NSUserDefaults* settings;

@end
