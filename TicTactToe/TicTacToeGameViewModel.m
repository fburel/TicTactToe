//
//  TicTacToeGameViewModel.m
//  TicTactToe
//
//  Created by Florian BUREL on 07/11/2014.
//  Copyright (c) 2014 Florian Burel. All rights reserved.
//

#import "TicTacToeGameViewModel.h"
#import "FBTicTacToeGame.h"
#import "GameService.h"

const NSString * EndOfGameNotification = @"endofgame";

@interface TicTacToeGameViewModel ()
@property (strong, nonatomic) FBTicTacToeGame * game;
@end

@implementation TicTacToeGameViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self startNewGame];
    }
    return self;
}

- (void) startNewGame
{
    self.game = (FBTicTacToeGame *)[[GameService sharedInstance] gameWithType:GameServiceTypeTicTacToe];
}

- (id) markAtPositionAtRow:(int)row column:(int)column
{
    return [self.game markAtPositionWithRow:row column:column];
}

- (void)markPositionAtRow:(int)row column:(int)column
{
    if([self.game markAtPositionWithRow:row column:column] != nil)
    {
        
    }
    else
    {
        [self.game addMarkAtPositionWithRow:row column:column];
        if(self.game.status == FBTicTacToeGameStatusStillPlaying)
        {
            // do nothing! position is busy
        }
        else
        {
            // send a notification alert
            NSString * message;
            switch (self.game.status) {
                case FBTicTacToeGameStatusEven:
                    message = @"Partie nulle";
                    break;
                case FBTicTacToeGameStatusBubbleWin:
                    message = @"Player 1 a gagner";
                    break;
                case FBTicTacToeGameStatusCrossWin:
                    message = @"Player 2 a gagner";
                    break;
                default:
                    break;
            }
            
            [[NSNotificationCenter defaultCenter]postNotificationName:(NSString *)EndOfGameNotification object:message];
        }

    }
}

@end
