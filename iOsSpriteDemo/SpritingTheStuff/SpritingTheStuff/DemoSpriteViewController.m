//
//  ViewController.m
//  SpritingTheStuff
//
//  Created by MTS on 4/12/15.
//  Copyright (c) 2015 +|. All rights reserved.
//

#import "DemoSpriteViewController.h"
#import "DemoMainMenuControllerViewController.h"
#import "DemoSpriteScene.h"
#import "SpriteSceneView.h"

@interface DemoSpriteViewController ()
@property (strong, nonatomic) IBOutlet SpriteSceneView* spriteMainView;
@property (strong, nonatomic) NSString* enemyColor;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@end    

@implementation DemoSpriteViewController


- (instancetype) initWithNibName: (NSString *) nibName AndTeamColor: (NSString *)color bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibName bundle: nibBundleOrNil];
    _enemyColor = color;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /* Load up the Sprite stuff with the things */
    _spriteMainView.showsDrawCount = YES;
    _spriteMainView.showsNodeCount = YES;
    _spriteMainView.showsFPS = YES;
    
    NSString *path = [[NSBundle mainBundle] resourcePath];
    NSFileManager *fm = [NSFileManager defaultManager];
    NSError *error = [[NSError alloc] init];
    NSArray *directoryAndFileNames = [fm contentsOfDirectoryAtPath:path error:&error];
    
}

-(void) viewWillAppear:(BOOL)animated
{
    CGSize window = _spriteMainView.bounds.size;
    DemoSpriteScene* scene = [[DemoSpriteScene alloc] initWithSize:CGSizeMake(window.width, window.height) AndColor:_enemyColor];
    
    [_spriteMainView presentScene:scene];
    [_spriteMainView setNeedsDisplay];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) restatGame: (id) sender
{
     DemoMainMenuControllerViewController *startGame = [[DemoMainMenuControllerViewController alloc] initWithNibName:@"DemoMainMenuControllerViewController" bundle:nil];
    [self presentViewController:startGame animated:YES completion:nil];

}

@end
