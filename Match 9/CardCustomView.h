//
//  CardCustomView.h
//  Match3
//
//  Created by Charles.Li on 2/13/14.
//  Copyright (c) 2014 Charles.Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardCustomView : UIView

-(void)cardContent;//abstract need to be implemented in subclass

@property (nonatomic, getter = isMatched) BOOL matched;
@property (nonatomic, getter = isChosen) BOOL chosen;

@end
