//
//  ViewController.h
//  Match5
//
//  Created by Charles.Li on 2/16/14.
//  Copyright (c) 2014 Charles.Li. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface ViewController : UIViewController

@property(nonatomic) NSUInteger cardNumber;


//for subclasses
-(Deck *)createDeck; //abstract
-(UIView *) displayView: (id)cardView forContent: (id)card;//abstract
-(void) actionResult: (id) cardview;//abstract
-(void)cardAnimate: (UIView *)cardView;//abstract

-(UIView *)displayViewforContent: (Card*)card;
-(NSUInteger)cardCount;
-(NSUInteger)gameType;
-(void)cardAnimateReset:(UIView *)cardView;
-(void)gridRefresh;
-(void)additionalRefresh;

@property (nonatomic) NSUInteger numberOfStartingCards;


@end
