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

- (void)createSceneContents
{
    self.backgroundColor = [SKColor blueColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    [self addChild: [self newDemoNode]];
}

- (SKSpriteNode*)newDemoNode
{
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"BodyTypeLarge" ofType:@"png"];
    SKSpriteNode* fighterBody = [SKSpriteNode spriteNodeWithImageNamed:imagePath];
    fighterBody.position = CGPointMake(100, 100);
    return fighterBody;
}

@end