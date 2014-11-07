//
//  GameService.m
//  TicTactToe
//
//  Created by Florian BUREL on 07/11/2014.
//  Copyright (c) 2014 Florian Burel. All rights reserved.
//

#import "GameService.h"
#import "FBTicTacToeGame.h"

@implementation GameService

+ (instancetype)sharedInstance {
    static id __SharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __SharedInstance = [[self alloc] init];
    });
    return __SharedInstance;
}

- (FBGame *)gameWithType:(GameServiceType)gameType
{
    FBGame * game = nil;
    
    if(gameType == GameServiceTypeTicTacToe)
    {
        game = [[FBTicTacToeGame alloc]init];
    }
    
    return game;
}


@end
