//
//  ViewController.m
//  SpritingTheStuff
//
//  Created by MTS on 4/12/15.
//  Copyright (c) 2015 +|. All rights reserved.
//

#import "DemoSpriteViewController.h"
#import "DemoSpriteScene.h"

@interface DemoSpriteViewController ()

@end    

@implementation DemoSpriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /* Load up the Sprite stuff with the things */
    SKView* spriteMainView = (SKView*)[self view];
    spriteMainView.showsDrawCount = YES;
    spriteMainView.showsNodeCount = YES;
    spriteMainView.showsFPS = YES;
    
    
    NSString *path = [[NSBundle mainBundle] resourcePath];
    NSFileManager *fm = [NSFileManager defaultManager];
    NSError *error = [[NSError alloc] init];
    NSArray *directoryAndFileNames = [fm contentsOfDirectoryAtPath:path error:&error];
    
}

-(void) viewWillAppear:(BOOL)animated
{
    CGSize window = self.view.bounds.size;
    DemoSpriteScene* scene = [[DemoSpriteScene alloc] initWithSize:CGSizeMake(window.width, window.height)];

    SKView* spriteView = (SKView*)self.view;
    
    [spriteView presentScene:scene];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
