//
//  DemoMainMenuControllerViewController.m
//  SpritingTheStuff
//
//  Created by Kit Cischke on 4/23/15.
//  Copyright (c) 2015 +|. All rights reserved.
//

#import "DemoMainMenuControllerViewController.h"
#import "DemoSpriteViewController.h"

@interface DemoMainMenuControllerViewController ()
@property (weak, nonatomic) IBOutlet UIButton *blueButton;
@property (weak, nonatomic) IBOutlet UIButton *redButton;

@end

@implementation DemoMainMenuControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    return self;
}

- (IBAction) startNewBlueGame: (id) sender
{
    DemoSpriteViewController *startGame = [[DemoSpriteViewController alloc] initWithNibName:@"DemoSpriteViewController" AndTeamColor:@"blue" bundle:nil];
    [self presentViewController:startGame animated:YES completion:nil];
}

- (IBAction) startNewRedGame: (id) sender
{
    DemoSpriteViewController *startGame = [[DemoSpriteViewController alloc] initWithNibName:@"DemoSpriteViewController" AndTeamColor:@"red"  bundle:nil];
    [self presentViewController:startGame animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
