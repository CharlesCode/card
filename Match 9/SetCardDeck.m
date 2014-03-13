//
//  SetCardDeck.m
//  Match3
//
//  Created by Charles.Li on 11/26/13.
//  Copyright (c) 2013 Charles.Li. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetCardDeck

-(instancetype)init
{
    self = [super init];
    
    if(self){
        
        for (NSString *shape in [SetCard validShape]) {
            
            for (NSString *color in [SetCard validColor]) {
                for (NSString *shade in [SetCard validShade]) {
                    for (NSUInteger number =1; number <=[SetCard maxNumber]; number++) {
                        SetCard *setCard = [[SetCard alloc] init];
                        setCard.color=color;
                        setCard.shape=shape;
                        setCard.shade=shade;
                        setCard.number=number;
                        [self addCard:setCard];
        
                    }
                }
            }
            }
        }
    
    
    
    return self;
    
}

@end
