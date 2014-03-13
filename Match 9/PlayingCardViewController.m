//
//  PlayingCardViewController.m
//  Match3
//
//  Created by Charles.Li on 2/16/14.
//  Copyright (c) 2014 Charles.Li. All rights reserved.
//

#import "PlayingCardViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCardCustomView.h"
#import "PlayingCard.h"

@interface PlayingCardViewController ()
@property (strong, nonatomic) Deck *deck;




@end

@implementation PlayingCardViewController


-(NSUInteger)cardCount{
    return 52;
}


- (BOOL)prefersStatusBarHidden {
    return YES;
}

//abstract to specific

//this is concretization of the method
-(Deck *)createDeck{
    return [[PlayingCardDeck alloc] init];
}


-(UIView *) displayView: (PlayingCardCustomView *)cardView forContent: (PlayingCard *)card{
    
    
    
    cardView.rank= card.rank;
    
    cardView.suit=card.suit;
    cardView.faceUp=card.chosen;
    cardView.matched=card.matched;
    return cardView;
}

-(UIView *)displayViewforContent:(PlayingCard *)card{
    
    PlayingCardCustomView *cardView=[[PlayingCardCustomView alloc] init];
    
    cardView.rank= card.rank;
    
    cardView.suit=card.suit;
    cardView.faceUp=card.chosen;
    cardView.matched=card.matched;
    return cardView;
}

-(void)cardAnimate:(UIView *)cardView{
    [UIView transitionWithView:cardView
                      duration:0.4
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        //cardview.faceUp = !cardview.faceUp;
                    }
                    completion:nil];
    
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
