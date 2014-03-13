//
//  Card.m
//  Match3
//
//  Created by Charles.Li on 10/30/13.
//  Copyright (c) 2013 Charles.Li. All rights reserved.
//

#import "Card.h"

@implementation Card

-(int) match:(NSArray *)otherCards
{
    NSLog(@"say yeah");
    int score =0;
    
    for (Card *card in otherCards) {
        
        if ([card.contents isKindOfClass:[NSString class]]){
        
        if ([card.contents isEqualToString:self.contents]){
            score=1;
        
        }
        }
    }
    return score;
    
}


@end
