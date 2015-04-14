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
@property float center;
@property float handScale;
@end

@implementation DemoFighterUser

- (void) createFighterSpriteForWindow: (CGSize)size withFighter: (CGSize)fighter
{
    _center = size.width / 2;
    NSLog(@"Center: %f : %f", _center, size.width);
    SKAction* rotate;
    [self setPunchingArea:size];
    
    rotate = [SKAction rotateByAngle: (M_PI / 8) duration:0];
    _userLeftFist = [self newDemoFist:size withBodySize: fighter Orientation:false];
    [_userLeftFist runAction:rotate];
    [self addChild:_userLeftFist];
    
    rotate = [SKAction rotateByAngle: -(M_PI / 8) duration:0];
    _userRightFist = [self newDemoFist:size withBodySize: fighter Orientation:true];
    [_userRightFist runAction:rotate];
    [self addChild:_userRightFist];
}

/*
 set the punching range
 */
- (void) setPunchingArea: (CGSize)size
{
    _minBounds.x = size.width * 0.25;
    _minBounds.y = size.height * 0.50;
    _maxBounds.x = size.width * 0.80;
    _maxBounds.y = size.height * 0.9;
}

/* Sprite Creation methods */
- (SKSpriteNode*)newDemoFist: (CGSize)size  withBodySize: (CGSize)body Orientation: (BOOL) orientation
{
    NSString *imagePath;
    if ( orientation ) {
        imagePath = [[NSBundle mainBundle] pathForResource:@"BoxingGloveLeft" ofType:@"png"];
    } else {
        imagePath = [[NSBundle mainBundle] pathForResource:@"BoxingGloveRight" ofType:@"png"];
    }
    SKSpriteNode* fist = [SKSpriteNode spriteNodeWithImageNamed:imagePath];
    if ( orientation ) {
        fist.position = CGPointMake((size.width *  0.25), (size.height * 0.5));
    } else {
        fist.position = CGPointMake((size.width *  0.75), (size.height * 0.5));
    }
    _handScale = (body.width * 0.75) / body.width;
    [fist setScale:_handScale];
    
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
    if ( location.x > _center) {
        [self punchFace:_userLeftFist AtLocation:location];
    } else {
        [self punchFace:_userRightFist AtLocation:location];
    }
}

- (void)punchFace: (SKSpriteNode*)fist AtLocation: (CGPoint)location
{
    int i;
    if ( ![self canPunchHere:location] ) {
        return;
    }
    NSMutableArray* actions;
    if ( !actions )
        actions = [[NSMutableArray alloc] init];
    NSLog(@"(%0.2f, %0.2f) to (%0.2f, %0.2f)", location.x, location.y, fist.position.x, fist.position.y);
    for ( i=0; i < 10; i++ ) {
        NSMutableArray *punchChanges;
        if ( !punchChanges )
            punchChanges = [[NSMutableArray alloc] init];
        
        float scaling = _handScale - (i * 0.025);
        float xScale = (location.x - fist.position.x) * 0.1;
        float yScale =  (location.y - fist.position.y) * 0.1;
        
        SKAction* resize = [SKAction scaleTo:scaling duration:0.01];
        SKAction* movement = [SKAction moveByX:xScale y:yScale duration:0.01];
        
        [punchChanges addObject:resize];
        [punchChanges addObject:movement];
        SKAction* step = [SKAction group:punchChanges];
        [actions addObject:step];
    }
    for ( i=9; i >= 0; i-- ) {
        NSMutableArray *punchChanges;
        if ( !punchChanges )
            punchChanges = [[NSMutableArray alloc] init];
        
        float scaling = _handScale - (i * 0.025);
        float xScale = (fist.position.x - location.x) * 0.1;
        float yScale =  (fist.position.y - location.y) * 0.1;
        
        SKAction* resize = [SKAction scaleTo:scaling duration:0.01];
        SKAction* movement = [SKAction moveByX:xScale y:yScale duration:0.01];
        
        [punchChanges addObject:resize];
        [punchChanges addObject:movement];
        SKAction* step = [SKAction group:punchChanges];
        [actions addObject:step];
    }
    SKAction* move = [SKAction sequence:actions];
    [fist runAction:move];
}

@end
