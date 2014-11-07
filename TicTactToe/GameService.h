//
//  GameService.h
//  TicTactToe
//
//  Created by Florian BUREL on 07/11/2014.
//  Copyright (c) 2014 Florian Burel. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FBGame;

typedef enum
{
    GameServiceTypeTicTacToe
} GameServiceType;

@interface GameService : NSObject

+ (instancetype)sharedInstance;

- (FBGame *) gameWithType:(GameServiceType)gameType;

@end
