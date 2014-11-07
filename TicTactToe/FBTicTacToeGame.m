//
//  FBTicTacToeGame.m
//  TicTactToe
//
//  Created by Florian BUREL on 07/11/2014.
//  Copyright (c) 2014 Florian Burel. All rights reserved.
//

#import "FBTicTacToeGame.h"
#import "FBBoard.h"
#import "FBBoardPosition.h"

@interface FBTicTacToeGame ()

@property (strong, nonatomic) FBBoard * board;

@end

const id FBTicTacToeGameBubble = @"Buble";
const id FBTicTacToeGameCross = @"Cross";

@implementation FBTicTacToeGame


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.board = [[FBBoard alloc]initWithSize:FBBoardSize2DTicTacToe];
    }
    return self;
}

- (void)reset
{
    [self.board clean];
    _currentPlayer = FBTicTacToeGamePlayerBubble;
}

- (id) markAtPositionWithRow:(int)row column:(int)column
{
    return [[self.board positionForRow:row column:column] content];
}
- (void)addMarkAtPositionWithRow:(int)row column:(int)column
{
    FBBoardPosition * position = [self.board positionForRow:row column:column];
    
    if(_currentPlayer == FBTicTacToeGamePlayerBubble)
    {
        position.content = FBTicTacToeGameBubble;
        _currentPlayer = FBTicTacToeGamePlayerCross;
    }
    else
    {
        position.content = FBTicTacToeGameCross;
        _currentPlayer = FBTicTacToeGamePlayerBubble;
    }
}

- (FBTicTacToeGameStatus)status
{
    // Check for column Win
    FBTicTacToeGamePlayer winner = [self winner];
    if(winner == FBTicTacToeGamePlayerBubble)
    {
        return FBTicTacToeGameStatusBubbleWin;
    }
    else if(winner == FBTicTacToeGamePlayerCross)
    {
        return FBTicTacToeGameStatusBubbleWin;
    }
    else if([self boardIsFull])
    {
        return FBTicTacToeGameStatusEven;
    }
    return FBTicTacToeGameStatusStillPlaying;
}

- (BOOL) boardIsFull
{
    BOOL boardIsNotFull = YES;
    
    for(int column = 0 ; column < self.board.size.numberOfColumn; column++)
    {
        for(int row = 0 ; row < self.board.size.numberOfRows; row++)
        {
            FBBoardPosition * position = [self.board positionForRow:row
                                                             column:column];
            
            boardIsNotFull = boardIsNotFull || (position.content == nil);
        }
        
        
    }

    return !boardIsNotFull;
}

- (FBTicTacToeGamePlayer) winner
{
    FBTicTacToeGamePlayer winner = 0;
    
    // Check the column
    for(int column = 0 ; column < self.board.size.numberOfColumn; column++)
    {
        NSMutableSet * positionToCheck = [[NSMutableSet alloc]init];
        
        for(int row = 0 ; row < self.board.size.numberOfRows; row++)
        {
            FBBoardPosition * position = [self.board positionForRow:row
                                                             column:column];
            [positionToCheck addObject:position];
        }
        
        winner = (winner != 0) ? winner : [self checkPositions:[positionToCheck copy]];
    }
    
    // Check the row
    for(int row = 0 ; row < self.board.size.numberOfRows; row++)
    {
        NSMutableSet * positionToCheck = [[NSMutableSet alloc]init];
        
        for(int column = 0 ; column < self.board.size.numberOfColumn; column++)
        {
            FBBoardPosition * position = [self.board positionForRow:row
                                                             column:column];
            [positionToCheck addObject:position];
        }
        
        winner = (winner != 0) ? winner : [self checkPositions:[positionToCheck copy]];
    }

    // Check the Diagonals
    {
        NSMutableSet * positionToCheck = [[NSMutableSet alloc]init];
        
        FBBoardPosition * position1 = [self.board positionForRow:0
                                                         column:0];
        FBBoardPosition * position2 = [self.board positionForRow:1
                                                         column:1];
        FBBoardPosition * position3 = [self.board positionForRow:2
                                                         column:2];
        
        [positionToCheck addObject:position1];
        [positionToCheck addObject:position2];
        [positionToCheck addObject:position3];
        
        winner = (winner != 0) ? winner : [self checkPositions:[positionToCheck copy]];
    }
    
    {
        NSMutableSet * positionToCheck = [[NSMutableSet alloc]init];
        
        FBBoardPosition * position1 = [self.board positionForRow:0
                                                          column:2];
        FBBoardPosition * position2 = [self.board positionForRow:1
                                                          column:1];
        FBBoardPosition * position3 = [self.board positionForRow:2
                                                          column:0];
        
        [positionToCheck addObject:position1];
        [positionToCheck addObject:position2];
        [positionToCheck addObject:position3];
        
        winner = (winner != 0) ? winner : [self checkPositions:[positionToCheck copy]];
    }
    
    return winner;
    
}

- (FBTicTacToeGamePlayer) checkPositions:(NSSet *)positions
{
    id value = nil;
    BOOL success = YES;
    
    for (FBBoardPosition * position in positions)
    {
        if(value == nil)
        {
            value =position.content;
        }
        else if(position.content == nil || position.content != value)
        {
            success = NO;
        }
    }
    
    if(success && value != nil)
    {
        FBTicTacToeGamePlayer winner = [value isEqual:FBTicTacToeGameBubble] ? FBTicTacToeGamePlayerBubble : FBTicTacToeGamePlayerCross;
        
        return winner;
    }
    else
    {
        return 0;
    }
    
}
@end
