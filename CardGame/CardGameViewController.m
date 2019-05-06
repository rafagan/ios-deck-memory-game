//
//  CardGameViewController.m
//  CardGame
//
//  Created by Rafagan Abreu on 30/01/14.
//  Copyright (c) 2014 Rafagan Abreu. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"
#import "ImageHandler.h"
#import "PropertyListCRUD.h"
#import "PlayerInfo.h"

@interface CardGameViewController ()
{
    PropertyListCRUD* pList;
    NSUserDefaults* userDefs;
}

@property (nonatomic,strong) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong,nonatomic) IBOutletCollection(UIButton) NSArray* cardButtons;
- (IBAction)onTouchEndGameButton:(id)sender;
@end

@implementation CardGameViewController

- (CardMatchingGame *)game
{
    if(!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self cardButtons].count usingDeck:[self createDeck]];
    return _game;
}

- (Deck*)createDeck
{
    return nil;
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    //Onde o botão clicado esta no IBOutletCollection
    NSUInteger cardIndex = [self.cardButtons indexOfObject:sender];
    
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
}

-(void)updateUI
{
    for(UIButton *cardButton in self.cardButtons) {
        NSUInteger cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card* card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)self.game.score];
}

//Observe o padrão usado - TITULO PARA CARTA: CARTA
- (NSString*)titleForCard:(Card*)card
{
    return card.isChosen ? card.contents : @"";
}

-(UIImage*)backgroundImageForCard:(Card*)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    userDefs = [NSUserDefaults standardUserDefaults];
}

- (void)viewDidAppear:(BOOL)animated
{
    pList = [[PropertyListCRUD alloc]initWithPropertyListName:@"hiScore"];
}

- (IBAction)onTouchEndGameButton:(id)sender {
    
    /* Salvando PrintScreen */
    NSMutableDictionary* sourceDict = [pList loadData];
    NSData* rawImage = [ImageHandler imageToRawData:[ImageHandler captureView:self.view]];
    [sourceDict setObject:rawImage forKey:@"snapshot"];
    
    /* Convertendo players do score para PlayerInfo */
    NSMutableArray *players = [NSMutableArray new];
    NSArray* orderedPlayers;
    [sourceDict enumerateKeysAndObjectsUsingBlock:^(id key, id object, BOOL *stop) {
        if([object isKindOfClass:[NSString class]]){
            PlayerInfo* player = [PlayerInfo createPlayerWithString:object];
            [players addObject:player];
        }
    }];
    
    //Adicionando novo jogador
    NSString* playerName = @"-0-";
    [players addObject:[PlayerInfo createPlayerWithName:playerName andScore:self.game.score]];
    
    orderedPlayers = [players sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        NSNumber *score1 = [NSNumber numberWithUnsignedInteger:[(PlayerInfo*)a score]];
        NSNumber *score2 = [NSNumber numberWithUnsignedInteger:[(PlayerInfo*)b score]];
        
        NSLog(@"%ld", [score2 compare:score1]);
        return [score2 compare:score1];
    }];
    
    //Verificando se o novo jogador não pertence ao top 5
    if([((PlayerInfo*)orderedPlayers.lastObject).nickname isEqualToString:playerName]) {
        [pList saveData:sourceDict]; //Salva PrintScreen e  encerra
        [self goToScreen:@"MainMenuViewController"];
        return;
    }
    
    //Descobre a posição do jogador no rank e atualizando dicionário
    int position = 0;
    for (int i=0;i<orderedPlayers.count-1;i++) {
        PlayerInfo* pl = orderedPlayers[i];
        
        if ([pl.nickname  isEqualToString: playerName]){
            position = i+1;
            pl.nickname = [userDefs objectForKey:@"name_preference"];
        }
        
        [sourceDict setObject:[[PlayerInfo createPlayerWithName:pl.nickname andScore:pl.score] getInfoAsString]
                       forKey:[self getNameByNumber:i+1]
         ];
    }
    
    //Repopulando lista de recordes
    [pList saveData:sourceDict];
    
    //Avisando o jogador do resultado
    NSString* concatPosition = [NSString stringWithFormat:@"NOVO RECORDE: %dº lugar",position];
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:concatPosition message:@"" delegate:self cancelButtonTitle:@"Voltar para o Menu" otherButtonTitles:@"Ver HI-Score", nil];
    alert.alertViewStyle = UIAlertViewStyleDefault;
    [alert show];
}

- (void)goToScreen:(NSString*)viewControllerName
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:viewControllerName];
    [vc setModalPresentationStyle:UIModalPresentationFullScreen];
    
    [self presentViewController:vc animated:YES completion:nil];
}

- (NSString*)getNameByNumber:(NSUInteger)number
{
    switch (number) {
        case 1: return @"First";
        case 2: return @"Second";
        case 3: return @"Third";
        case 4: return @"Fourth";
        case 5: return @"Fifth";
    }
    return @"";
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        [self goToScreen:@"MainMenuViewController"];
    } else {
        [self goToScreen:@"HiScoreViewController"];
    }
}
@end
