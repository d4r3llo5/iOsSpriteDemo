//
//  DemoFighterUser.m
//  SpritingTheStuff
//
//  Created by Kit Cischke on 4/14/15.
//  Copyright (c) 2015 +|. All rights reserved.
//

#import "DemoFighterUser.h"

@interface DemoFighterUser()

@property (strong, nonatomic) SKSpriteNode* userRightFist;
@property (strong, nonatomic) SKSpriteNode* userLeftFist;
@property CGPoint minBounds;        // Min bounds for the punch area
@property CGPoint maxBounds;        // Max bounds for the punch area
@end

@implementation DemoFighterUser

- (void) createFighterSpriteForWindow: (CGSize)size
{
    [self setPunchingArea:size];
    _userLeftFist = [self newDemoFist:size Orientation:false];
    [self addChild:_userLeftFist];
    _userRightFist = [self newDemoFist:size Orientation:true];
    [self addChild:_userRightFist];
}

/*
 set the punching range
 */
- (void) setPunchingArea: (CGSize)size
{
    _minBounds.x = size.width * 0.25;
    _minBounds.y = size.height * 0.25;
    _maxBounds.x = size.width * 0.80;
    _maxBounds.y = size.height * 0.60;
}

/* Sprite Creation methods */
- (SKSpriteNode*)newDemoFist: (CGSize)size Orientation: (BOOL) orientation
{
    NSString *imagePath;
    if ( orientation ) {
        imagePath = [[NSBundle mainBundle] pathForResource:@"BoxingGloveLeft" ofType:@"png"];
    } else {
        imagePath = [[NSBundle mainBundle] pathForResource:@"BoxingGloveRight" ofType:@"png"];
    }
    SKSpriteNode* fist = [SKSpriteNode spriteNodeWithImageNamed:imagePath];
    if ( orientation ) {
        fist.position = CGPointMake((size.width *  0.25), (size.height * 0.6));
    } else {
        fist.position = CGPointMake((size.width *  0.75), (size.height * 0.6));
    }
    return fist;
}

- (BOOL)canPunchHere: (CGPoint)location
{
    if ( (location.x > _minBounds.x) && (location.x < _maxBounds.x) &&
         (location.y > _minBounds.y) && (location.y < _maxBounds.y) ) {
        return true;
    }
    return false;
}

/*
 called from scene to animate the fist punch
 */
- (void)animateHitAtPunch: (CGPoint)location
{
    int i;
    if ( ![self canPunchHere:location] ) {
        return;
    }
    NSMutableArray* actions;
    for ( i=0; i < 10; i++ ) {
        NSMutableArray *punchChanges;
        if ( punchChanges )
             punchChanges = [[NSMutableArray alloc] init];
        float scaling = 1.0 - (i * 0.2);
        float xScale = (location.x - _userLeftFist.position.x) * (1 - (i * 0.1));
        float yScale =  (location.y - _userLeftFist.position.y) * (1 - (i * 0.1));;
        
        SKAction* resize = [SKAction scaleTo:scaling duration:0.1];
        SKAction* movement = [SKAction moveByX:xScale y:yScale duration:0.1];
        
        [punchChanges addObject:resize];
        [punchChanges addObject:movement];
        SKAction* step = [SKAction group:punchChanges];
        [actions addObject:step];
    }
    SKAction* move = [SKAction sequence:actions];
    [_userLeftFist runAction:move];
}

@end
