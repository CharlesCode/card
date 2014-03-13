//
//  PlayingCard.h
//  Match3
//
//  Created by Charles.Li on 10/30/13.
//  Copyright (c) 2013 Charles.Li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card


@property(strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+(NSArray *)validSuits;
+(NSUInteger)maxRank;
@end
