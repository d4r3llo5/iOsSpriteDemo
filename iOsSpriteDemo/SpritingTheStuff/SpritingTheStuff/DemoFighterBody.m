//
//  DemoFighterBody.m
//  SpritingTheStuff
//
//  Created by Kit Cischke on 4/14/15.
//  Copyright (c) 2015 +|. All rights reserved.
//

#import "DemoFighterBody.h"

@interface DemoFighterBody()

@property (strong, nonatomic) SKSpriteNode* fighterHead;
@property (strong, nonatomic) SKSpriteNode* fighterBody;
@property (strong, nonatomic) NSString* enemyColor;

@end

@implementation DemoFighterBody

- (instancetype) initWithColor:(NSString *) color
{
    self = [super init];
    _enemyColor = color;
    return self;
}

- (void) createFighterSpriteForWindow: (CGSize)size WithColor:(NSString *)color
{
    _fighterBody = [self newDemoBodyForWindow:size];
    [self addChild:_fighterBody];
    _fighterHead = [self newDemoHeadForWindow:size Above:(_fighterBody.size.height * 0.75)];
    [self addChild:_fighterHead];
    _enemyColor = color;
        NSLog(@"Meow Color is: %@", _enemyColor);
}

/* Sprite Creation methods */
- (SKSpriteNode*)newDemoBodyForWindow: (CGSize) size
{
    NSString *imagePath;
    if ( [_enemyColor isEqualToString:@"red"] ) {
        imagePath = [[NSBundle mainBundle] pathForResource:@"BodyTypeLarge" ofType:@"png"];
    } else {
        imagePath = [[NSBundle mainBundle] pathForResource:@"BodyTypeSmall" ofType:@"png"];
    }
    SKSpriteNode* fighterBody = [SKSpriteNode spriteNodeWithImageNamed:imagePath];
    fighterBody.position = CGPointMake((size.width / 2), (size.height / 2));
    fighterBody.name = @"fighterBody";
    fighterBody.userInteractionEnabled = false;
        NSLog(@"Color is: %@", _enemyColor);
    return fighterBody;
}

- (SKSpriteNode*)newDemoHeadForWindow: (CGSize) size Above: (float) bodyHeight
{
    NSString *imagePath;
    if ( [_enemyColor isEqualToString:@"red"] ) {
        imagePath = [[NSBundle mainBundle] pathForResource:@"KitsHead" ofType:@"png"];
    } else {
        imagePath = [[NSBundle mainBundle] pathForResource:@"GlenFace" ofType:@"png"];
    }
    SKSpriteNode* fighterHead = [SKSpriteNode spriteNodeWithImageNamed:imagePath];
    fighterHead.position = CGPointMake((size.width / 2), (size.height / 2) + bodyHeight);
    fighterHead.name = @"fighterHead";
        NSLog(@"Color is: %@", _enemyColor);
    return fighterHead;
}

- (CGSize)getFighterSize {
    return _fighterBody.size;
}

/*
  called from scene to see when a user tapped an area if that area is the fighter's face
 */
- (BOOL)didTapFighterFaceAtLocation: (CGPoint) location
{
    
    SKSpriteNode* headNode = [self childNodeWithName:@"fighterHead"];
    SKSpriteNode* node = [self nodeAtPoint:location];
    
    if ( [node isEqual:headNode] ) {
        return true;
    }
    return false;
}

- (void) animateHit
{
    SKAction* resizeAa = [SKAction scaleTo:0.9 duration: 0.10];
    SKAction* resizeBa = [SKAction scaleTo:1.1 duration: 0.10];
    SKAction* resizeAb = [SKAction scaleTo:0.9 duration: 0.10];
    SKAction* resizeBb =    [SKAction scaleTo:1.1 duration: 0.10];
    SKAction* resizeC = [SKAction scaleTo:1.0 duration: 0.10];
    SKAction* move = [SKAction sequence:@
                  [resizeAa, resizeBa, resizeAb, resizeBb, resizeC]];
    [_fighterHead runAction:move];
}

@end
