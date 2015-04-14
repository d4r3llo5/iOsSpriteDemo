//
//  DemoFighterUser.h
//  SpritingTheStuff
//
//  Created by Kit Cischke on 4/14/15.
//  Copyright (c) 2015 +|. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface DemoFighterUser : SKSpriteNode
- (void) animateHitAtPunch: (CGPoint)location;
- (void) createFighterSpriteForWindow: (CGSize)size;
@end
