//
//  CardMatchingGame.h
//  Match3
//
//  Created by Charles.Li on 11/5/13.
//  Copyright (c) 2013 Charles.Li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

//designated initatializer
-(instancetype) initWithCardCount: (NSUInteger) count usingDeck: (Deck *) deck;

-(void) chooseCardAtIndex: (NSUInteger) index countType: (NSUInteger)count;
-(void) chooseCardAtIndexforSet: (NSUInteger) index;


-(id)cardAtIndex: (NSUInteger) index;

@property (nonatomic, readonly) NSInteger score;


@property (strong, nonatomic) NSString *gameText;
@property (nonatomic, strong) NSMutableArray *history;

@property (nonatomic, strong) NSMutableArray *setgameOutput;





@end
