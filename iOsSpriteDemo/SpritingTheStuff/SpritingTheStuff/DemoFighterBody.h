//
//  DemoFighterBody.h
//  SpritingTheStuff
//
//  Created by Kit Cischke on 4/14/15.
//  Copyright (c) 2015 +|. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface DemoFighterBody : SKSpriteNode

- (void) createFighterSpriteForWindow: (CGSize)size;
- (BOOL)didTapFighterFaceAtLocation: (CGPoint) location;

- (CGSize)getFighterSize;

- (void) animateHit;
@end
