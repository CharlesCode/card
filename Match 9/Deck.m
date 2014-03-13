//
//  Deck.m
//  Match3
//
//  Created by Charles.Li on 10/30/13.
//  Copyright (c) 2013 Charles.Li. All rights reserved.
//

#import "Deck.h"

@interface Deck ()

@property (strong, nonatomic) NSMutableArray *cards; //a deck of cards

@end

@implementation Deck

//last instantial of deck of cards
-(NSMutableArray *)cards {
    if (!_cards){
        _cards=[[NSMutableArray alloc] init];

    }
    
    return _cards;
}


//adding cards on the top
-(void)addCard:(Card *)card atTop:(BOOL)atTop
{
    if(atTop){
        [self.cards insertObject:card atIndex:0];
    }
    else{
        [self.cards addObject:card];
    }
    
}


//automatically adds cards to the bottom

-(void)addCard:(Card *)card {
    [self addCard:card atTop:NO];
}


//draw a random card and remove it from cards

-(Card *)drawRandomCard{
    
    Card *randomCard =nil;
    
    if ([self.cards count]){
    unsigned index = arc4random() % [self.cards count];
    randomCard=self.cards[index];
    [self.cards removeObjectAtIndex:index];
    }
    
    return randomCard;
}

@end
