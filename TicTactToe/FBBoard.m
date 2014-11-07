//
//  Board.m
//  TicTactToe
//
//  Created by Florian BUREL on 07/11/2014.
//  Copyright (c) 2014 Florian Burel. All rights reserved.
//

#import "FBBoard.h"
#import "FBBoardPosition.h"

// Déclare des properties privés
@interface FBBoard ()

@property (nonatomic) FBBoardSize2D size;
@property (strong, nonatomic) NSSet * positions;

@end


@implementation FBBoard

const FBBoardSize2D FBBoardSize2DTicTacToe = {3, 3};
const FBBoardSize2D FBBoardSize2DChess = {8, 8};
const FBBoardSize2D FBBoardSize2DCheckers = {10, 10};

- (instancetype)init
{
    return [self initWithSize:FBBoardSize2DTicTacToe];
}

- (instancetype)initWithSize:(FBBoardSize2D)size
{
    self = [super init];
    if (self) {
        self.size = size;
        [self createBoardPositions];
        [self clean];
    }
    return self;
}

- (void) createBoardPositions
{
    NSMutableSet * tempPositionHolder = [[NSMutableSet alloc]init];
    
    for(int rowID = 0 ; rowID < self.size.numberOfRows; rowID++)
    {
        for (int columID = 0; columID < self.size.numberOfColumn; columID++)
        {
            FBBoardPosition * position = [[FBBoardPosition alloc]initWithRow:rowID column:columID];
            
            [tempPositionHolder addObject:position];
        }
    }
    
    self.positions = [tempPositionHolder copy];
}

- (void) clean
{
    for(FBBoardPosition * position in self.positions)
    {
        position.content = nil;
    }
}

- (FBBoardPosition *)positionForRow:(int)row column:(int)column
{
 
    NSSet * matchingPosition = [self.positions objectsPassingTest:^BOOL(FBBoardPosition * position, BOOL *stop) {
        return (position.row == row) && (position.column == column);
    }];
    
    return [matchingPosition anyObject];
}
@end
