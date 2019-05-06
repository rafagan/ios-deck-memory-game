//
//  PropertyListCRUD.h
//  Exercicio pList
//
//  Created by Rafagan Abreu on 23/01/14.
//  Copyright (c) 2014 Rafagan Abreu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PropertyListCRUD : NSObject

@property (nonatomic,strong) NSString *pListName;
@property (nonatomic,strong) NSString *pListPath;
@property (nonatomic,strong) NSString *validDirectoryPath;


//Designated Initializer
- (instancetype)initWithPropertyListName:(NSString*)name;

- (NSMutableDictionary*)loadData;
- (void)saveData:(NSMutableDictionary*)content;

@end
