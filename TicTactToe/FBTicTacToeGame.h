//
//  FBTicTacToeGame.h
//  TicTactToe
//
//  Created by Florian BUREL on 07/11/2014.
//  Copyright (c) 2014 Florian Burel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FBGame.h"

typedef enum
{
    FBTicTacToeGamePlayerCross = 1,
    FBTicTacToeGamePlayerBubble = 2
} FBTicTacToeGamePlayer;

typedef enum
{
    FBTicTacToeGameStatusEven,
    FBTicTacToeGameStatusBubbleWin,
    FBTicTacToeGameStatusCrossWin,
    FBTicTacToeGameStatusStillPlaying
} FBTicTacToeGameStatus;


extern const id FBTicTacToeGameBubble;
extern const id FBTicTacToeGameCross;

@interface FBTicTacToeGame : FBGame

- (void) reset;

@property (assign, readonly) FBTicTacToeGamePlayer currentPlayer;

@property (assign, readonly) FBTicTacToeGameStatus status;

- (void) addMarkAtPositionWithRow:(int)row column:(int)column;

- (id) markAtPositionWithRow:(int)row column:(int)column;

@end
