//
//  PlayingCardCustomView.m
//  Match3
//
//  Created by Charles.Li on 2/13/14.
//  Copyright (c) 2014 Charles.Li. All rights reserved.
//

#import "PlayingCardCustomView.h"


@interface PlayingCardCustomView ()

@property (nonatomic) CGRect suitSize;


@end


@implementation PlayingCardCustomView


//Setters Yo
-(void) setSuit:(NSString *)suit
{
    _suit =suit;
    [self setNeedsDisplay];
}

-(void)setRank:(NSUInteger)rank{
    _rank = rank;
    [self setNeedsDisplay];
}

-(void)setFaceUp:(BOOL)faceUp{
    _faceUp=faceUp;
    [self setNeedsDisplay];
}


-(NSString *)rankAsString{
    return @[@"?",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"j",@"q",@"k"][self.rank];
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


//this is helper method for placing shit
#define CORNER_FONT_STANDARD_HEIGHT 180.0
#define CORNER_RADIUS 12.0


-(CGFloat) cornerScaleFactor{
    return self.bounds.size.height/CORNER_FONT_STANDARD_HEIGHT;
}

-(CGFloat) cornerRadius{
    return CORNER_RADIUS * [self cornerScaleFactor];
}

-(CGFloat) cornerOffset {
    return [self cornerRadius]/1.0;
}
/////


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */




//draw the stuff on the card



-(CGRect) suitSize{
    
    CGRect tempSize=CGRectMake([self cornerOffset], [self cornerOffset]*3, [self cornerOffset], [self cornerOffset]);
    
    
    
    return tempSize;
}

-(void)cardContent{
    
    
    if (self.faceUp){
        [self drawCorner];
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextTranslateCTM(context, self.bounds.size.width, self.bounds.size.height);
        CGContextRotateCTM(context, M_PI);
        
        [self drawCorner];

        }
   else{
    
       [[UIImage imageNamed:@"PlayingCardCustomViewBack"] drawInRect:self.bounds];
        
        }
    
    
    
}

-(void)drawCorner{
    [self drawRankString];
    
    
    [self drawSuit];
    
    
}



-(void)drawRankString{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment=NSTextAlignmentCenter;
    UIFont *cornerFont = [UIFont preferredFontForTextStyle:UIFontWeightTrait];
    cornerFont=[cornerFont fontWithSize:cornerFont.pointSize*[self cornerScaleFactor]*1.2];
    
    NSAttributedString *cornerText = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@", [self rankAsString]] attributes:@{NSFontAttributeName: cornerFont, NSParagraphStyleAttributeName: paragraphStyle, NSForegroundColorAttributeName: [self rankColorBySuit]}];
    
    CGRect textBonds;
    textBonds.origin = CGPointMake([self cornerOffset], [self cornerOffset]);
    textBonds.size = [cornerText size];
    [cornerText drawInRect:textBonds];
    
    
    
}

-(UIColor *)rankColorBySuit{
    if ([self.suit isEqualToString:@"❤︎"] || [self.suit isEqualToString:@"◆"]){
        return [UIColor colorWithRed:255/255.0f green:76/255.0f blue:77/255.0f alpha:1.0f];
    }
    else {
        return [UIColor blackColor];
    }
    
}


-(void)drawSuit{
    
    if ([self.suit isEqualToString:@"❤︎"]){
        [self drawHeart];
    }
    else if ([self.suit isEqualToString:@"◆"]){
        [self drawDiamond];
    }
    else if ([self.suit isEqualToString:@"♠︎"]){
        [self drawSpade];
    }
    else{
        [self drawClub];
    }
    
    
}



//this is to draw the the shapes
-(void)drawClub{
    UIBezierPath *topCircle =[UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.suitSize.origin.x, self.suitSize.origin.y-self.suitSize.size.height/4, self.suitSize.size.height/2, self.suitSize.size.height/2)];
    UIBezierPath *bottomLeftCircle=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.suitSize.origin.x-self.suitSize.size.height/4, self.suitSize.origin.y+self.suitSize.size.height/4, self.suitSize.size.height/2, self.suitSize.size.height/2)];
    UIBezierPath *bottomRightCircle=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.suitSize.origin.x+self.suitSize.size.height/4, self.suitSize.origin.y+self.suitSize.size.height/4, self.suitSize.size.height/2, self.suitSize.size.height/2)];
    [[UIColor blackColor] setStroke];
    
    topCircle.lineWidth=0.5;
    bottomLeftCircle.lineWidth=0.5;
    bottomRightCircle.lineWidth=0.5;
    
    [topCircle stroke];
    [bottomLeftCircle stroke];
    [bottomRightCircle stroke];
}

-(void)drawHeart{
    
    UIBezierPath *heart =[UIBezierPath bezierPath];
    [heart moveToPoint:CGPointMake(self.suitSize.origin.x, self.suitSize.origin.y)];
    [heart addLineToPoint:CGPointMake(self.suitSize.origin.x+self.suitSize.size.width, self.suitSize.origin.y)];
    [heart addLineToPoint:CGPointMake(self.suitSize.origin.x+self.suitSize.size.width/2, self.suitSize.origin.y+self.suitSize.size.height)];
    [heart closePath];
    
    [[UIColor colorWithRed:255/255.0f green:76/255.0f blue:77/255.0f alpha:1.0f] setStroke];
    heart.lineWidth=0.5;
    [heart stroke];
    
}


-(void)drawSpade{
    
    UIBezierPath *spade =[UIBezierPath bezierPath];
    [spade moveToPoint:CGPointMake(self.suitSize.origin.x+self.suitSize.size.width/2, self.suitSize.origin.y)];
    [spade addLineToPoint:CGPointMake(self.suitSize.origin.x, self.suitSize.origin.y+self.suitSize.size.height)];
    [spade addLineToPoint:CGPointMake(self.suitSize.origin.x+self.suitSize.size.width, self.suitSize.origin.y+self.suitSize.size.height)];
    [spade closePath];
    
    [[UIColor blackColor] setStroke];
    spade.lineWidth=0.5;
    [spade stroke];
    
}


-(void)drawDiamond{
    UIBezierPath *diamond =[UIBezierPath bezierPath];
    [diamond moveToPoint:CGPointMake(self.suitSize.origin.x+self.suitSize.size.width/2, self.suitSize.origin.y)];
    [diamond addLineToPoint:CGPointMake(self.suitSize.origin.x, self.suitSize.origin.y+self.suitSize.size.height/2)];
    [diamond addLineToPoint:CGPointMake(self.suitSize.origin.x+self.suitSize.size.width/2, self.suitSize.origin.y+self.suitSize.size.height)];
    [diamond addLineToPoint:CGPointMake(self.suitSize.origin.x+self.suitSize.size.width, self.suitSize.origin.y+self.suitSize.size.height/2)];
    
    
    [diamond closePath];
    [[UIColor colorWithRed:255/255.0f green:76/255.0f blue:77/255.0f alpha:1.0f] setStroke];
    diamond.lineWidth=0.5;
    [diamond stroke];
}


@end
