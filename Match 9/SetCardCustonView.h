//
//  SetCardCustonView.h
//  Match 9
//
//  Created by Charles.Li on 3/1/14.
//  Copyright (c) 2014 Charles.Li. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardCustomView.h"

@interface SetCardCustonView : CardCustomView

@property(nonatomic, strong) NSString *color;
@property (nonatomic, strong) NSString *shade;
@property (nonatomic) NSUInteger number;
@property (nonatomic, strong) NSString *shape;


@end
