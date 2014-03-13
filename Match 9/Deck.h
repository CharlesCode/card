//
//  Deck.h
//  Match3
//
//  Created by Charles.Li on 10/30/13.
//  Copyright (c) 2013 Charles.Li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject
-(void)addCard: (Card *)card atTop: (BOOL) atTop;
-(void)addCard:(Card *)card;

-(Card *)drawRandomCard;


@end
