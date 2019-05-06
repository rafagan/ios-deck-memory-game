//
//  HiScoreViewController.m
//  CardGame
//
//  Created by Rafagan Abreu on 01/02/14.
//  Copyright (c) 2014 Rafagan Abreu. All rights reserved.
//

#import "HiScoreViewController.h"
#import "PropertyListCRUD.h"
#import "PlayerInfo.h"

@interface HiScoreViewController ()
@property (weak, nonatomic) IBOutlet UILabel *firstName;
@property (weak, nonatomic) IBOutlet UILabel *firstScore;
@property (weak, nonatomic) IBOutlet UILabel *secondName;
@property (weak, nonatomic) IBOutlet UILabel *secondScore;
@property (weak, nonatomic) IBOutlet UILabel *thirdName;
@property (weak, nonatomic) IBOutlet UILabel *thirdScore;
@property (weak, nonatomic) IBOutlet UILabel *forthName;
@property (weak, nonatomic) IBOutlet UILabel *forthScore;
@property (weak, nonatomic) IBOutlet UILabel *fifthName;
@property (weak, nonatomic) IBOutlet UILabel *fifthScore;

@end

@implementation HiScoreViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	PropertyListCRUD* pList = [[PropertyListCRUD alloc] initWithPropertyListName:@"hiScore"];
    NSMutableDictionary* dict = [pList loadData];
    
    PlayerInfo* player = [PlayerInfo createPlayerWithString:[dict objectForKey:@"First"]];
    _firstName.text = player.nickname;
    _firstScore.text = [ NSString stringWithFormat:@"%lu", (unsigned long)player.score ];
    
    player = [PlayerInfo createPlayerWithString:[dict objectForKey:@"Second"]];
    _secondName.text = player.nickname;
    _secondScore.text = [ NSString stringWithFormat:@"%lu", (unsigned long)player.score ];
    
    player = [PlayerInfo createPlayerWithString:[dict objectForKey:@"Third"]];
    _thirdName.text = player.nickname;
    _thirdScore.text = [ NSString stringWithFormat:@"%lu", (unsigned long)player.score ];
    
    player = [PlayerInfo createPlayerWithString:[dict objectForKey:@"Fourth"]];
    _forthName.text = player.nickname;
    _forthScore.text = [ NSString stringWithFormat:@"%lu", (unsigned long)player.score ];
    
    player = [PlayerInfo createPlayerWithString:[dict objectForKey:@"Fifth"]];
    _fifthName.text = player.nickname;
    _fifthScore.text = [ NSString stringWithFormat:@"%lu", (unsigned long)player.score ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
