//
//  CardGameViewController.h
//  CardGame
//
//  Created by Rafagan Abreu on 30/01/14.
//  Copyright (c) 2014 Rafagan Abreu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface CardGameViewController : UIViewController <UIAlertViewDelegate>
- (IBAction)touchCardButton:(UIButton *)sender;

// Abstract Protected Method
- (Deck*)createDeck;

@end
