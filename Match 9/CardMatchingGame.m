//
//  CardMatchingGame.m
//  Match3
//
//  Created by Charles.Li on 11/5/13.
//  Copyright (c) 2013 Charles.Li. All rights reserved.
//

#import "CardMatchingGame.h"
@interface CardMatchingGame ()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards;
@property (nonatomic, strong) NSMutableArray *cardsArray;



@end

@implementation CardMatchingGame

static const int MISMATCH_PENALTY =2;
static const int MATCH_BONUS =4;
static const int COST_TO_CHOOSE = 1;


//this is what the output of the set game
-(NSMutableArray *)setgameOutput {
    if (!_setgameOutput){
        _setgameOutput = [[NSMutableArray alloc] init];
        
    }
    return _setgameOutput;
}

-(NSMutableArray *)cards
{
    if (!_cards) _cards=[[NSMutableArray alloc] init];
    return _cards;
    
}

-(NSMutableArray *)history
{
    if (!_history) _history=[[NSMutableArray alloc] init];
    return _history;
    
}


-(NSMutableArray *) cardsArray
{
    if (!_cardsArray) _cardsArray =[[NSMutableArray alloc] init];
    return _cardsArray;
}
//designated initatializer
-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self =[super init];
    
    
    if (self) {
        
        for (int i=0; i<count; i++){
            Card *card =[deck drawRandomCard];
        if(card){
            [self.cards addObject:card];
        }
        else{
            self=nil;
            break;
        }
        }
    }
    return self;
}

///card at index

-(id)cardAtIndex:(NSUInteger)index
{
    return (index <[self.cards count]) ? self.cards[index]:nil;
}

///logic of the game
//-(void) chooseCardAtIndex:(NSUInteger)index countType: (NSUInteger)count
//{
//    NSMutableArray *cardsArray=[[NSMutableArray alloc] init];
//    
//    Card *card = [self cardAtIndex:index];
//    if (!card.isMatched){
//        if (card.isChosen){
//            card.chosen=NO;
//        }
//        else
//        {
//            //match it against other card
//            
//            for (Card *otherCard in self.cards) {
//                if(otherCard.isChosen && !otherCard.isMatched){
//                    int matchScore=[card match:@[otherCard]];
//                    if(matchScore){
//                        self.score+= matchScore * MATCH_BONUS;
//                        card.matched=YES;
//                        otherCard.matched=YES;
//                        self.gameText= [NSString stringWithFormat:@"%@ and %@ does match", card.contents, otherCard.contents];
//            
//                    }
//                    else{
//                        otherCard.chosen=NO;
//                        self.score-=MISMATCH_PENALTY;
//                        self.gameText= [NSString stringWithFormat:@"%@ and %@ does not match", card.contents, otherCard.contents];
//                    }
//                     break;
//                }
//                self.gameText= [NSString stringWithFormat:@"%@", card.contents];
//               
//            }
//            self.score-=COST_TO_CHOOSE;
//            card.Chosen=YES;
//            
//        }
//        
//    }
//}





-(void) chooseCardAtIndex:(NSUInteger)index countType: (NSUInteger)gameType
{
    //NSLog(@"this is getting called");
    
    Card *card = [self cardAtIndex:index];
    if ([card.contents isKindOfClass:[NSString class]]) {
         self.gameText= [NSString stringWithFormat:@"%@", card.contents];
    }
    else if ([card.contents isKindOfClass:[NSDictionary class]]){
        self.setgameOutput=nil;
        [self.setgameOutput addObject:card.contents];
    }
    //[self.history addObject:self.gameText];
    
    if (!card.isMatched){
        if (card.isChosen){
            card.chosen=YES;
           
            
        }
        
        else
        {
            for (Card *otherCard in self.cards) {
                if(otherCard.isChosen && !otherCard.isMatched && ![self.cardsArray containsObject:otherCard]){
                    if ([self.cardsArray count]+1==gameType){
                        [self.cardsArray addObject:otherCard];
                        int matchScore=[card match:self.cardsArray];
                        if(matchScore){
                            
                            if ([card.contents isKindOfClass:[NSString class]]){
                            self.gameText= [NSString stringWithFormat:@"%@ matched with", card.contents];
                            }
                            else if ([card.contents isKindOfClass:[NSDictionary class]]){
                                self.setgameOutput = Nil;
                                [self.setgameOutput addObject: card.contents];
                                [self.setgameOutput addObject:@"matched with"];
                                
                            }
                            
                            
                            //[self.history addObject:self.gameText];
                            
                            for (Card *nextCard in self.cardsArray) {
                                nextCard.matched=YES;
                                
                                
                                if([nextCard.contents isKindOfClass:[NSString class]]){
                                self.gameText = [self.gameText stringByAppendingString:[NSString stringWithFormat:@" %@", nextCard.contents]];
                                }
                                else if ([nextCard.contents isKindOfClass:[NSDictionary class]]){
                                    [self.setgameOutput addObject: nextCard.contents];
                                    
                                   //NSLog(@"%d", [self.setgameOutput count]);
                                    
                                }
                                //[self.history addObject:self.gameText];
                                
                            }
                            card.matched=YES;
                            self.score+= matchScore * MATCH_BONUS;
                            [self.cardsArray removeAllObjects];
                        }
                        else{
                            if ([card.contents isKindOfClass:[NSString class]]){
                            self.gameText= [NSString stringWithFormat:@"%@ does not matched with", card.contents];
                            //[self.history addObject:self.gameText];
                            }
                            else if ([card.contents isKindOfClass:[NSDictionary class]]){
                                self.setgameOutput=nil;
                                [self.setgameOutput addObject:card.contents];
                                [self.setgameOutput addObject:@"does not match with"];
                                
                                
                            }
                            
                            //create an dictionary of the shit in the card
                            
                            
                            
                            for (Card *nextCard in self.cardsArray) {
                                nextCard.chosen=!nextCard.chosen;
                                
                                if([nextCard.contents isKindOfClass:[NSString class]]){
                                self.gameText = [self.gameText stringByAppendingString:[NSString stringWithFormat:@" %@", nextCard.contents]];
                                    
                                    
                                }
                                else if ([nextCard.contents isKindOfClass:[NSDictionary class]]){
                                    //self.setgameOutput=nil;
                                    [self.setgameOutput addObject:nextCard.contents];
                                    
                                    //NSLog(@"%d", [self.setgameOutput count]);
                                  
                                }
                                
                                //[self.history addObject:self.gameText];
                            }
                            [self.cardsArray removeAllObjects];
                            self.score-=MISMATCH_PENALTY;
                            
                        }
                        break;
                    }
                    
                    else if ([self.cardsArray count]+1<gameType) {
                        [self.cardsArray addObject:otherCard];
                        
                        
                    }
                    
                    
                        }
                    }
                }
            
            
            self.score-=COST_TO_CHOOSE;
            card.chosen=!card.chosen;
        [self.cardsArray removeObject:card];
            
        }
        
    }

-(void) chooseCardAtIndexforSet: (NSUInteger) index{
    [self chooseCardAtIndex:index countType:2];
}


@end
