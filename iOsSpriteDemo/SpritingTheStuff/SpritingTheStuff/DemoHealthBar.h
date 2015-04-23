//
//  DemoHealthBar.h
//  SpritingTheStuff
//
//  Created by Kit Cischke on 4/16/15.
//  Copyright (c) 2015 +|. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface DemoHealthBar : SKSpriteNode
- (void)createHealthBarWithBounds: (CGSize) size AtLocation: (float)yLoc;
- (void) animateHealthLoss;
- (BOOL)getHealthLeft;

@end
