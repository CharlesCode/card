//
//  PlayingCardCustomView.h
//  Match3
//
//  Created by Charles.Li on 2/13/14.
//  Copyright (c) 2014 Charles.Li. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardCustomView.h"

@interface PlayingCardCustomView : CardCustomView

@property(nonatomic) NSUInteger rank;
@property(nonatomic) NSString *suit;
@property(nonatomic) BOOL faceUp;

@end
