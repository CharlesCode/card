//
//  SetCardViewController.m
//  Match 9
//
//  Created by Charles.Li on 3/2/14.
//  Copyright (c) 2014 Charles.Li. All rights reserved.
//

#import "SetCardViewController.h"
#import "SetCardCustonView.h"
#import "SetCard.h"
#import "SetCardDeck.h"

@interface SetCardViewController ()

@end

@implementation SetCardViewController

-(void) additionalRefresh{
    [self gridRefresh];
}

-(NSUInteger)cardCount{
    return 81;
}

-(NSUInteger)gameType{
    return 2;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}


-(Deck *)createDeck{
    return [[SetCardDeck alloc] init];
}



-(UIView *) displayView: (SetCardCustonView *)cardView forContent: (SetCard *)card{
    
    
    
    cardView.number= card.number;
    
    cardView.shade=card.shade;
    cardView.shape=card.shape;
    cardView.color=card.color;
    cardView.matched=card.matched;
      cardView.chosen=card.chosen;
    return cardView;
}

-(UIView *)displayViewforContent:(SetCard *)card{
    
    SetCardCustonView* cardView=[[SetCardCustonView alloc] init];
    
    cardView.number= card.number;
    
    cardView.shade=card.shade;
    cardView.shape=card.shape;
    cardView.color=card.color;
    cardView.matched=card.matched;
    cardView.chosen=card.chosen;
    return cardView;
}


-(void)cardAnimateReset:(UIView *)cardView{
    [UIView transitionWithView:cardView
                      duration:0.8
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        //cardview.faceUp = !cardview.faceUp;
                    }
                    completion:nil];
    
}

//remove the matched cards


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
