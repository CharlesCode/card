//
//  PlayingCardDeck.m
//  Match3
//
//  Created by Charles.Li on 10/30/13.
//  Copyright (c) 2013 Charles.Li. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

-(instancetype)init
{
    self = [super init];
    
    if(self){
        
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank =1; rank <=[PlayingCard maxRank]; rank++) {
                PlayingCard *playingCard = [[PlayingCard alloc] init];
                playingCard.rank=rank;
                playingCard.suit=suit;
                [self addCard:playingCard];
                
            }
        }
        
        
    }
    
    
    return self;
    
}

@end
