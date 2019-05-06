//
//  SettingsViewController.m
//  CardGame
//
//  Created by Rafagan Abreu on 01/02/14.
//  Copyright (c) 2014 Rafagan Abreu. All rights reserved.
//

#import "SettingsViewController.h"
#import "DataSource.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nickname;
@property (weak, nonatomic) IBOutlet UISwitch *showSettings;
@property (weak, nonatomic) IBOutlet UISlider *volume;
@property (weak, nonatomic) IBOutlet UISegmentedControl *difficultLevel;

- (IBAction)showSettingsValueChanged:(id)sender;
- (IBAction)volumeChanged:(id)sender;
- (IBAction)difficultChanged:(id)sender;
- (IBAction)finishedNickEdition:(id)sender;
- (IBAction)onTouchSaveChanges:(id)sender;

@end

@implementation SettingsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _showSettings.on = ((NSNumber*)[DATA_SRC.settings objectForKey:@"enabled_preference"]).boolValue;
    _volume.value = ((NSNumber*)[DATA_SRC.settings objectForKey:@"volume_preference"]).floatValue;
    _difficultLevel.selectedSegmentIndex = ((NSString*)[DATA_SRC.settings objectForKey:@"difficult_preference"]).integerValue;
    
    _nickname.text = [DATA_SRC.settings objectForKey:@"name_preference"];
    if(_nickname.text.length < 3) _nickname.text = @"PLR";
    _nickname.text = [[_nickname.text substringToIndex:3] uppercaseString];
    
    self.nickname.delegate = self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [[self nickname] resignFirstResponder];
    return YES;
}

- (IBAction)showSettingsValueChanged:(id)sender {
    NSNumber* tmp = @(_showSettings.on);
    [DATA_SRC.settings setObject:tmp forKey:@"enabled_preference"];
}

- (IBAction)volumeChanged:(id)sender {
    NSNumber* tmp = @(_volume.value);
    [DATA_SRC.music setVolume:_volume.value];
    [DATA_SRC.settings setObject:tmp forKey:@"volume_preference"];
}

- (IBAction)difficultChanged:(id)sender {
    NSString* tmp = [ NSString stringWithFormat:@"%ld", (long)_difficultLevel.selectedSegmentIndex ];
    [DATA_SRC.settings setObject:tmp forKey:@"difficult_preference"];
}

- (IBAction)finishedNickEdition:(id)sender {
    if(_nickname.text.length < 3) return;
    
    [DATA_SRC.settings setObject:[[_nickname.text substringToIndex:3] uppercaseString] forKey:@"name_preference"];
}

- (IBAction)onTouchSaveChanges:(id)sender {
    [DATA_SRC.settings synchronize];
}
@end
