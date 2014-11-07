//
//  TicTacToeGameViewModel.h
//  TicTactToe
//
//  Created by Florian BUREL on 07/11/2014.
//  Copyright (c) 2014 Florian Burel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FBTicTacToeGame.h"

extern const NSString * EndOfGameNotification;

@interface TicTacToeGameViewModel : NSObject

- (void) startNewGame;

- (void) markPositionAtRow:(int)row column:(int)column;

- (id) markAtPositionAtRow:(int)row column:(int)column;

@end
