//
//  DemoSpriteScene.h
//  SpritingTheStuff
//
//  Created by MTS on 4/12/15.
//  Copyright (c) 2015 +|. All rights reserved.
//

#ifndef SpritingTheStuff_DemoSpriteScene_h
#define SpritingTheStuff_DemoSpriteScene_h

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "DemoFighterBody.h"
#import "DemoFighterUser.h"
#import "DemoHealthBar.h"
@interface DemoSpriteScene : SKScene

- (instancetype) initWithSize:(CGSize)size AndColor:(NSString*) color;

@end

#endif