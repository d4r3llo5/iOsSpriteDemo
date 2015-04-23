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
@property (strong, nonatomic) DemoHealthBar* userHealth;
@property (strong, nonatomic) DemoHealthBar* enemyHealth;
@property (strong, nonatomic) NSString* enemyColor;
@end

@implementation DemoSpriteScene

- (instancetype) initWithSize:(CGSize)size AndColor:(NSString*) color
{
    self = [super initWithSize:size];
    _enemyColor = color;
    return self;
}

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
        _enemy = [[DemoFighterBody alloc] initWithColor:_enemyColor];
        [_enemy createFighterSpriteForWindow:self.view.bounds.size WithColor:_enemyColor];
    }
    if (!_user) {
        _user = [[DemoFighterUser alloc] init];
        [_user createFighterSpriteForWindow:self.view.bounds.size withFighter:_enemy.getFighterSize];
    }
    if (!_userHealth) {
        _userHealth = [[DemoHealthBar alloc] init];
        [_userHealth createHealthBarWithBounds:self.view.bounds.size AtLocation:40];
    }
    if (!_enemyHealth) {
        _enemyHealth = [[DemoHealthBar alloc] init];
        [_enemyHealth createHealthBarWithBounds:self.view.bounds.size AtLocation:(self.view.bounds.size.height - 40)];
    }
    
    self.backgroundColor = [SKColor blueColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    [self addChild:_enemy];
    [self addChild:_user];
    [self addChild:_userHealth];
    [self addChild:_enemyHealth];
}

/*
    Touch event: Tap
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch =  [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    
    //NSLog(@"Touch: (%f,%F)", [touch locationInView:self.view].x, [touch locationInView:self.view].y);
    
    if ( [_user canPunchHere:location] ) {
        [_user animateHitAtPunch:location];
    
        if ( [_enemy didTapFighterFaceAtLocation:location] ) {
            [_enemy animateHit];
            if ( [_enemyHealth getHealthLeft] ) {
                [_enemyHealth animateHealthLoss];
            }
        }
    }
}


@end