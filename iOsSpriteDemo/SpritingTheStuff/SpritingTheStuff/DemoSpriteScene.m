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
@property (strong, nonatomic) DemoFighterBody* enemy;
@property (strong, nonatomic) DemoFighterUser* user;
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
    if (!_enemy) {
        _enemy = [[DemoFighterBody alloc] init];
        [_enemy createFighterSpriteForWindow:self.view.bounds.size];
    }
    if (!_user) {
        _user = [[DemoFighterUser alloc] init];
        [_user createFighterSpriteForWindow:self.view.bounds.size withFighter:_enemy.getFighterSize];
    }
    self.backgroundColor = [SKColor blueColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    [self addChild:_enemy];
    [self addChild:_user];
}

/*
    Touch event: Tap
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch =  [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    
    NSLog(@"Touch: (%f,%F)", [touch locationInView:self.view].x, [touch locationInView:self.view].y);
    
    [_user animateHitAtPunch:location];
    
    if ( [_enemy didTapFighterFaceAtLocation:location] ) {
        [_enemy animateHit];
    }
}


@end