//
//  MainMenuViewController.m
//  CardGame
//
//  Created by Rafagan Abreu on 01/02/14.
//  Copyright (c) 2014 Rafagan Abreu. All rights reserved.
//

#import "MainMenuViewController.h"
#import "PropertyListCRUD.h"
#import "PlayerInfo.h"
#import "GameMusic.h"
#import "DataSource.h"

@interface MainMenuViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *lastPlaySnapshot;
@end

@implementation MainMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    PropertyListCRUD* pList = [[PropertyListCRUD alloc] initWithPropertyListName:@"hiScore"];
    NSMutableDictionary* dict = [pList loadData];
    
    if(dict.count < 4 || dict == nil) {
        if(dict == nil) dict = [NSMutableDictionary new];
        
        [dict setObject:[[PlayerInfo createPlayerWithName:@"BAR" andScore:500] getInfoAsString] forKey:@"First"];
        [dict setObject:[[PlayerInfo createPlayerWithName:@"NIC" andScore:200] getInfoAsString] forKey:@"Second"];
        [dict setObject:[[PlayerInfo createPlayerWithName:@"JOE" andScore:150] getInfoAsString] forKey:@"Third"];
        [dict setObject:[[PlayerInfo createPlayerWithName:@"LEI" andScore:100] getInfoAsString] forKey:@"Fourth"];
        [dict setObject:[[PlayerInfo createPlayerWithName:@"ZOE" andScore:50] getInfoAsString] forKey:@"Fifth"];
        
        [pList saveData:dict];
    } else {
        UIImage* img =[UIImage imageWithData:[dict objectForKey:@"snapshot"]];
        [_lastPlaySnapshot setImage:img];
    }
    
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]){
        // iOS 7
        [self prefersStatusBarHidden];
        [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
    }
    else
    {
        // iOS 6
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
