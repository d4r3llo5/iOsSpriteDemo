//
//  DemoSpriteScene.m
//  SpritingTheStuff
//
//  Created by MTS on 4/12/15.
//  Copyright (c) 2015 +|. All rights reserved.
//

#import "DemoSpriteScene.h"

@interface DemoSpriteScene()
@property BOOL contentCreated;
@end

@implementation DemoSpriteScene

- (void)didMoveToView:(SKView *)view
{
    if (!self.contentCreated)
    {
        [self createSceneContents];
        self.contentCreated = true;
    }
}

@end