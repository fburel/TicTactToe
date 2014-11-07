//
//  Board.h
//  TicTactToe
//
//  Created by Florian BUREL on 07/11/2014.
//  Copyright (c) 2014 Florian Burel. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FBBoardPosition;

@interface FBBoard : NSObject

typedef struct {
    int numberOfRows;
    int numberOfColumn;
} FBBoardSize2D;


extern const FBBoardSize2D FBBoardSize2DTicTacToe;
extern const FBBoardSize2D FBBoardSize2DChess;
extern const FBBoardSize2D FBBoardSize2DCheckers;

@property (readonly, nonatomic) FBBoardSize2D size;

- (instancetype) initWithSize:(FBBoardSize2D)size;

- (FBBoardPosition *) positionForRow:(int)row column:(int)column;

- (void) clean;

@end
