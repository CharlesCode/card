//
//  CardCustomView.m
//  Match3
//
//  Created by Charles.Li on 2/13/14.
//  Copyright (c) 2014 Charles.Li. All rights reserved.
//

#import "CardCustomView.h"

@implementation CardCustomView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.


- (void)drawRect:(CGRect)rect
{
    UIBezierPath *roundRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:4];
    [roundRect addClip];
    
    
    [[UIColor whiteColor] setFill];
    [[UIColor grayColor] setStroke];
    roundRect.lineWidth=2.0;
    
    
    UIRectFill(self.bounds);
    [self cardContent];
    
    
    
    
    
    
}

-(void)cardContent{
    
}



-(void) awakeFromNib{
    [self setUp];
}

-(void)setUp{
    self.backgroundColor=[UIColor clearColor];

    self.opaque=NO;
    self.contentMode=UIViewContentModeRedraw;
    
    
}

@end
