//
//  DemoHealthBar.m
//  SpritingTheStuff
//
//  Created by Kit Cischke on 4/16/15.
//  Copyright (c) 2015 +|. All rights reserved.
//

#import "DemoHealthBar.h"
@interface DemoHealthBar()

@property float health;
@property CGPoint location;
@property CGSize bounds;

@property (strong, nonatomic) SKSpriteNode* healthBar;
@property (strong, nonatomic) SKSpriteNode* healthLeft;

@end

@implementation DemoHealthBar

- (void)createHealthBarWithBounds:(CGSize)size AtLocation: (float) yLoc
{
    CGSize bounds = size;
    CGSize remain;
    float xLoc;
    _health = 1.0;
    
    bounds.width = size.width * 0.8;
    bounds.height = 10;
    remain = bounds;
    remain.width *= _health;
    
    _healthBar = [SKSpriteNode spriteNodeWithColor:[UIColor redColor] size:bounds];
    _healthLeft = [SKSpriteNode spriteNodeWithColor:[UIColor greenColor] size:remain];
    
    xLoc = (size.width / 2) - (_healthBar.size.width / 2);
    _healthBar.anchorPoint = CGPointMake(0, 0);
    _healthLeft.anchorPoint = CGPointMake(0, 0);
    
    _healthLeft.position = CGPointMake( xLoc, yLoc );
    _healthBar.position = CGPointMake( xLoc, yLoc );
    
    [self addChild:_healthBar];
    [self addChild:_healthLeft];
}

- (BOOL)getHealthLeft
{
    NSLog(@"Health remaining: %f", _healthLeft.size.width);
    return (_healthLeft.size.width > 0);
}

- (void) animateHealthLoss
{
    NSMutableArray* actions;
    int i;
    if ( !actions )
        actions = [[NSMutableArray alloc] init];
    for ( i=0; i < 10; i++ ) {
        float xScale = (_healthLeft.size.width) - _healthBar.size.width * 0.05;
        SKAction* resize = [SKAction resizeToWidth:xScale duration:0.1];
        
        [actions addObject:resize];
    }
    SKAction* move = [SKAction sequence:actions];
    [_healthLeft runAction: move];
}

@end
