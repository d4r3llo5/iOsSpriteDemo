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
    SKSpriteNode* temp;
    self.backgroundColor = [SKColor blueColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    temp = [self newDemoBody];
    [self addChild:temp];
    temp = [self newDemoHeadAbove:(temp.size.height * 0.75)];
    [self addChild:temp];
}

/*
    Touch event: Tap
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch =  [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    
    SKSpriteNode* headNode = [self childNodeWithName:@"fighterHead"];
    SKSpriteNode* node = [self nodeAtPoint:location];
    
    NSLog(@"Touch: (%f,%F)", [touch locationInView:self.view].x, [touch locationInView:self.view].y);
    
    if ( [node isEqual:headNode] ) {
        SKAction* resizeAa = [SKAction scaleTo:0.9 duration: 0.10];
        SKAction* resizeBa = [SKAction scaleTo:1.1 duration: 0.10];
        SKAction* resizeAb = [SKAction scaleTo:0.9 duration: 0.10];
        SKAction* resizeBb =    [SKAction scaleTo:1.1 duration: 0.10];
        SKAction* resizeC = [SKAction scaleTo:1.0 duration: 0.10];
        SKAction* move = [SKAction sequence:@
                    [resizeAa, resizeBa, resizeAb, resizeBb, resizeC]];
        [headNode runAction:move];
    }
}

/* Sprite Creation methods */
- (SKSpriteNode*)newDemoBody
{
    CGSize window = self.view.bounds.size;
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"BodyTypeLarge" ofType:@"png"];
    SKSpriteNode* fighterBody = [SKSpriteNode spriteNodeWithImageNamed:imagePath];
    fighterBody.position = CGPointMake((window.width / 2), (window.height / 2));
    fighterBody.name = @"fighterBody";
    fighterBody.userInteractionEnabled = false;
    return fighterBody;
}

- (SKSpriteNode*)newDemoHeadAbove: (float) bodyHeight
{
    CGSize window = self.view.bounds.size;
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"KitsHead" ofType:@"png"];
    SKSpriteNode* fighterHead = [SKSpriteNode spriteNodeWithImageNamed:imagePath];
    fighterHead.position = CGPointMake((window.width / 2), (window.height / 2) + bodyHeight);
    fighterHead.name = @"fighterHead";
    return fighterHead;
}

@end