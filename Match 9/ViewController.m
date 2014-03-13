//
//  ViewController.m
//  Match5
//
//  Created by Charles.Li on 2/16/14.
//  Copyright (c) 2014 Charles.Li. All rights reserved.
//

#import "ViewController.h"
#import "Card.h"
#import "CardMatchingGame.h"
#import "Grid.h"
#import "SetCardCustonView.h"



@interface ViewController ()

@property(strong, nonatomic) CardMatchingGame *game; //this is going to be the array of all of the cards

@property(strong, nonatomic) NSMutableArray *cardCollection;//this is going to the array of all of the views cards

@property(strong, nonatomic) Grid *grid;

@property (weak, nonatomic) IBOutlet UIView *cardPlayingSurface;

@property (strong, nonatomic) NSMutableArray *cardViewCollection;

@property (weak, nonatomic) IBOutlet UIButton *resetButtonState;

@end

@implementation ViewController

//initiating shit for fun
#pragma mark-initialization

 -(CardMatchingGame *)game{
 if (!_game){
 _game=[[CardMatchingGame alloc] initWithCardCount:[self cardCount] usingDeck:[self createDeck]];
 }
 
 return _game;
 }

-(Grid *)grid{
    if(!_grid){
        _grid=[[Grid alloc] init];
        
    }
    return _grid;
}


-(NSMutableArray *)cardCollection{
    if (!_cardCollection) {
        _cardCollection=[[NSMutableArray alloc] init];
        
        for (int index=0; index<[self cardCount]; index++){
            
            Card *card=[self.game cardAtIndex:index];
            //[self addViewtoCardView: card];
            
            UIView *cardView;
            cardView=[self displayViewforContent:card];
            
            [cardView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)]];
            
            cardView.layer.opaque=NO;
            
            //this adds to the nsmutablearray
            [self.cardCollection addObject:cardView];
        }
    }
    return _cardCollection;
}

-(NSMutableArray *)cardViewCollection{
    
    if (!_cardViewCollection){
        
        _cardViewCollection =[[NSMutableArray alloc] init];
        for (int i=0; i<self.numberOfStartingCards; i++){
            [self.cardViewCollection addObject:self.cardCollection[i]];
        }
    }
    return _cardViewCollection;
}

////set up
#pragma mark-setup

- (BOOL)prefersStatusBarHidden {
    return YES;
}

static const CGFloat CELL_WIDTH=35.0;
static const CGFloat CELL_HEIGHT=50.0;


-(void)setUpGrid{
    self.grid.size=CGSizeMake(self.cardPlayingSurface.bounds.size.width, self.cardPlayingSurface.bounds.size.height);
    self.grid.cellAspectRatio=CELL_WIDTH/CELL_HEIGHT;
    self.grid.minimumNumberOfCells=[self.cardViewCollection count];
}




-(void)populateGrid{
    
    NSUInteger cols = self.grid.columnCount;
    int frameIndex = 0;
    
    
    for (UIView *view in self.cardViewCollection) {
        
        
        NSUInteger index = [self.cardCollection indexOfObject:view];
        
        
        Card *card = [self.game cardAtIndex:index];
        
        if (card && !card.isMatched) {
            
            NSUInteger row = frameIndex / cols;
            NSUInteger col = frameIndex % cols;
            
            CGRect frame = [self.grid frameOfCellAtRow:row inColumn:col];
            
            frame.size.width = frame.size.width*.95;
            frame.size.height=frame.size.height*.95;
            
            
            view.frame = frame;
            frameIndex++;
            [self.cardPlayingSurface addSubview:view];
            
            
        }
    }
}

#pragma mark-for subclass
//for subclass////////////////////
-(Deck *)createDeck{
    return nil;
}
-(void) actionResult: (id) cardview{
    
}

-(UIView *) displayView: (id)cardView forContent: (id)card{
    return Nil;
}

-(void)cardAnimate: (UIView *)cardView{
    
}

-(NSUInteger)cardCount{
    return 0;
    
}
-(UIView *)displayViewforContent: (Card*)card{
    return nil;
}

-(NSUInteger)gameType{
    return 1;
}

-(void)cardAnimateReset:(UIView *)cardView{
    
}
-(void)additionalRefresh{
    
}

//////////////////////////
#pragma mark-view code

- (IBAction)resetTap {
    
    for (UIView *cardView in [self.cardPlayingSurface subviews]){
        [self removeCards: cardView];
    }
    self.game=Nil;
    self.cardViewCollection=Nil;
}


-(void)removeCards: (UIView *)cardView{
    
    [UIView animateWithDuration:1
                     animations:^{
                         self.resetButtonState.hidden=YES;
                         int x =(arc4random()%(int)(self.cardPlayingSurface.bounds.size.width*5))-(int)self.cardPlayingSurface.bounds.size.width*2;
                         int y = (int)self.cardPlayingSurface.bounds.size.height*1.2;
                         cardView.center=CGPointMake(x, y);
    
    }
                     completion:^(BOOL finish){if(finish){
        [cardView removeFromSuperview];
        [self putCardsBack];
    }}];
}

-(void)putCardsBack{
    [UIView animateWithDuration:1 delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
        [self gridRefresh];
        [self updateUI];
        
    }
                     completion:nil];
}


- (void) updateUI{
    for (UIView* cardView in self.cardViewCollection){
        NSUInteger cardIndex=[self.cardCollection indexOfObject:cardView];
        Card* card = [self.game cardAtIndex:cardIndex];
       [self displayView: cardView forContent: card];
        
        if (card.isMatched){
            cardView.alpha=0.2;
        }
        else{
            cardView.alpha=1.0;
        }
        
      
    }
    
    [self additionalRefresh];
    
}

//this recognizes the action but also figure what card to flip

-(void)tap:(UITapGestureRecognizer*)gesture{
    self.resetButtonState.hidden=NO;
    CGPoint tapLocation = [gesture locationInView:self.cardPlayingSurface];
    UIView *cardView = [self.cardPlayingSurface hitTest:tapLocation withEvent:nil];
    
    NSUInteger index = [self.cardCollection indexOfObject:cardView];
    Card *card=[self.game cardAtIndex:index];
    
    [self.game chooseCardAtIndex: index countType:[self gameType]];
    if(!card.matched){
    [self cardAnimate:cardView];
    }
   
    
    [self updateUI];
    
}

- (IBAction)addThreeCards {
    
    
      NSUInteger count=  [self.cardViewCollection count];
    
        if (count<[self cardCount]-1){
        for (NSUInteger i=count+1; i<count+4; i++){
           Card *card=[self.game cardAtIndex:i];
        UIView *cardView=[self.cardCollection objectAtIndex:i];
            [self displayView:cardView forContent:card];
        [self.cardViewCollection addObject:cardView];
        }
        [self gridRefresh];
       }
}


/////////////////


-(void)gridRefresh{
    [self setUpGrid];
    [self populateGrid];
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    self.numberOfStartingCards=20;
    [self gridRefresh];
    
    self.resetButtonState.hidden=YES;
    
    
	// Do any additional setup after loading the view, typically from a nib.
    
}

-(void)viewDidLayoutSubviews{
    
   
    
    for (UIView *view in self.cardViewCollection){
        
        
        [view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)]];
        
    }
    
     [self gridRefresh];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
