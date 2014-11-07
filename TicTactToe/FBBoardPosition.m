//
//  BoardPosition.m
//  TicTactToe
//
//  Created by Florian BUREL on 07/11/2014.
//  Copyright (c) 2014 Florian Burel. All rights reserved.
//

#import "FBBoardPosition.h"

@implementation FBBoardPosition

- (instancetype)initWithRow:(int)row column:(int)column
{
    self = [super init];
    if (self) {
        _column = column;
        _row = row;
    }
    return self;
}
- (BOOL)isEqual:(id)other
{
    if (other == self) {
        return YES;
    } else if (!other || ![other isKindOfClass:[self class]])
    {
        return NO;
    } else {
        
        return ([self column] == [other column]) && ([self row] == [other row]);
    }
}

- (NSUInteger)hash
{
    return 10 * [self column] + [self row];
}

@end
