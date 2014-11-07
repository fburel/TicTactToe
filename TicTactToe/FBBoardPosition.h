//
//  BoardPosition.h
//  TicTactToe
//
//  Created by Florian BUREL on 07/11/2014.
//  Copyright (c) 2014 Florian Burel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FBBoardPosition : NSObject

- (instancetype) initWithRow:(int)row column:(int)column;

@property (assign, readonly, nonatomic) int row;
@property (assign, readonly, nonatomic) int column;

@property (strong, nonatomic) id content;

@end
