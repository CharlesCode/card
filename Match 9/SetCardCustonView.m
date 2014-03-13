//
//  SetCardCustonView.m
//  Match 9
//
//  Created by Charles.Li on 3/1/14.
//  Copyright (c) 2014 Charles.Li. All rights reserved.
//

#import "SetCardCustonView.h"
#import "SetCard.h"
#import "SetCardDeck.h"
#import "SetCardCustonView.h"

@interface SetCardCustonView ()
@property (nonatomic) CGRect iconSize;

@end

@implementation SetCardCustonView




- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

#pragma mark-Setters
//lets set the setter
-(void) setColor: (NSString*)color{
    _color=color;
    [self setNeedsDisplay];
}

-(void) setShade:(NSString *)shade{
    _shade=shade;
    [self setNeedsDisplay];
}
-(void)setNumber:(NSUInteger)number{
    _number=number;
    [self setNeedsDisplay];
}
-(void)setShape:(NSString *)shape{
    _shape=shape;
    [self setNeedsDisplay];
}

#pragma mark-Set up the view

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
-(CGRect) iconSize{
    CGRect tempRect;
    tempRect.origin.x=self.frame.size.width/2;
    tempRect.origin.y=self.frame.size.height/2;
    tempRect.size.width=self.frame.size.width*.3;
    tempRect.size.height=self.frame.size.height*.1;
    
    return tempRect;
}


#pragma mark-Drawing


-(void)cardContent{
    
    if (self.number==1){
    [self applyShape: self.iconSize];
        
    }
    else if (self.number==2){
        CGRect tempRect=self.iconSize;
        tempRect.origin.y=self.iconSize.origin.y+self.iconSize.size.height*.7;
        [self applyShape: tempRect];
        
        
        CGRect tempRectTwo=tempRect;
        tempRectTwo.origin.y=self.iconSize.origin.y-self.iconSize.size.height*.7;
        [self applyShape:tempRectTwo];
        
    }
    else if(self.number==3) {
        
        [self applyShape:self.iconSize];
        
        CGRect tempRect=self.iconSize;
        tempRect.origin.y=self.iconSize.origin.y+self.iconSize.size.height*1.4;
        [self applyShape: tempRect];
        
        CGRect tempRectTwo=self.iconSize;
        tempRectTwo.origin.y=self.iconSize.origin.y-self.iconSize.size.height*1.4;
        [self applyShape: tempRectTwo];
    
    }
    
    if (self.chosen){
        //self.alpha=.2;
        
        [[self applyColor] setStroke];
        
        UIRectFrame(self.bounds);
    
    }
    else{
        self.alpha=1;
        
    }
    
    
    
}

-(UIColor *)applyColor{
    
    if ([self.color isEqualToString:@"red"]) {
         return [UIColor colorWithRed:255/255.0f green:76/255.0f blue:77/255.0f alpha:1.0f];
        
    }
    else if([self.color isEqualToString:@"blue"]){
        return [UIColor colorWithRed:63/255.0f green:184/255.0f blue:255/255.0f alpha:1.0f];
        
    }
    else if([self.color isEqualToString:@"yellow"]){
        return [UIColor colorWithRed:135/255.0f green:57/255.0f blue:232/255.0f alpha:1.0f];
    }
    else {
    return [UIColor blackColor];
    }
}

-(void)applyNumber{
    
}

-(CGFloat)applyShade{
    if ([self.shade isEqualToString:@"filled"]){
        return 1;
    }
    else if ([self.shade isEqualToString:@"transperant"]){
        return 0.2;
    }
    else if ([self.shade isEqualToString:@"empty"]) {
        return 0;
    }
    else {
        return 0.2;
    }
    
}

-(void)applyShape: (CGRect) frameRect{
    
    if ([self.shape isEqualToString:@"●"]){
        [self drawSquiggle: frameRect];
    }
    else if ([self.shape isEqualToString:@"■"]){
        [self drawSetRect: frameRect];
    }
    else if ([self.shape isEqualToString:@"▲"]){
        [self drawFatDiamond: frameRect];
    }
    else{
        [self drawDefaultCircle: frameRect];
    }
}

-(void)drawSetRect: (CGRect) frameRect{
    

    UIBezierPath *setRect=[UIBezierPath bezierPath];
    [setRect moveToPoint:CGPointMake(frameRect.origin.x-frameRect.size.width/2, frameRect.origin.y-frameRect.size.height/2)];
    [setRect addLineToPoint:CGPointMake(frameRect.origin.x+frameRect.size.width/2, frameRect.origin.y-frameRect.size.height/2)];
    [setRect addLineToPoint:CGPointMake(frameRect.origin.x+frameRect.size.width/2, frameRect.origin.y+frameRect.size.height/2)];
    [setRect addLineToPoint:CGPointMake(frameRect.origin.x-frameRect.size.width/2, frameRect.origin.y+frameRect.size.height/2)];
    [setRect closePath];
    
    [[self applyColor] setStroke];
   [[[self applyColor] colorWithAlphaComponent:[self applyShade]] setFill];
    //setRect.fill;
     
    
    setRect.lineWidth=0.5;
    [setRect stroke];
    
    [setRect fill];
    
    

}

-(void)drawFatDiamond: (CGRect) frameRect{
    UIBezierPath *fatDiamond =[UIBezierPath bezierPath];
    [fatDiamond moveToPoint:CGPointMake(frameRect.origin.x-frameRect.size.width/2, frameRect.origin.y)];
    [fatDiamond addLineToPoint:CGPointMake(frameRect.origin.x, frameRect.origin.y+frameRect.size.height/2)];
    [fatDiamond addLineToPoint:CGPointMake(frameRect.origin.x+frameRect.size.width/2, frameRect.origin.y)];
    [fatDiamond addLineToPoint:CGPointMake(frameRect.origin.x, frameRect.origin.y-frameRect.size.height/2)];
    [fatDiamond closePath];
    
    [[self applyColor] setStroke];
    [[[self applyColor] colorWithAlphaComponent:[self applyShade]] setFill];
    
    
   
    fatDiamond.lineWidth=0.5;
    [fatDiamond stroke];
    [fatDiamond fill];
    NSLog(@"Hi");
    ///more
}
    
    

-(void)drawSquiggle: (CGRect) frameRect{
    
    UIBezierPath *squiggle =[UIBezierPath bezierPath];
    [squiggle moveToPoint:CGPointMake(frameRect.origin.x-frameRect.size.width/2, frameRect.origin.y-frameRect.size.height/2)];
    
    [squiggle addLineToPoint:CGPointMake(frameRect.origin.x, frameRect.origin.y-frameRect.size.height/2)];
    [squiggle addLineToPoint:CGPointMake(frameRect.origin.x+frameRect.size.width/2, frameRect.origin.y)];
    [squiggle addLineToPoint:CGPointMake(frameRect.origin.x+frameRect.size.width/2, frameRect.origin.y+frameRect.size.height/2)];
    [squiggle addLineToPoint:CGPointMake(frameRect.origin.x, frameRect.origin.y+frameRect.size.height/2)];
    [squiggle addLineToPoint:CGPointMake(frameRect.origin.x-frameRect.size.width/2, frameRect.origin.y)];
    [squiggle closePath];
    
    
    
    [[self applyColor] setStroke];
       [[[self applyColor] colorWithAlphaComponent:[self applyShade]] setFill];
 
    squiggle.lineWidth=0.5;
    [squiggle stroke];
    [squiggle fill];
    
   
    
}

-(void)drawDefaultCircle: (CGRect) frameRect{
    UIBezierPath *defaultCircle =[UIBezierPath bezierPathWithOvalInRect:frameRect];
    [[self applyColor] setStroke];
    [[self applyColor] setFill];
    
    defaultCircle.lineWidth=0.5;
    [[[self applyColor] colorWithAlphaComponent:[self applyShade]] setFill];
    [defaultCircle fill];
    
    self.alpha=[self applyShade];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
