//
//  ViewController.m
//  TicTactToe
//
//  Created by Florian BUREL on 07/11/2014.
//  Copyright (c) 2014 Florian Burel. All rights reserved.
//

#import "ViewController.h"
#import "TicTacToeGameViewModel.h"
#import "FBTicTacToeGame.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *boardView;

@property (strong) TicTacToeGameViewModel * viewModel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.viewModel = [[TicTacToeGameViewModel alloc]init];
}

- (void)viewDidLayoutSubviews
{
    int rowSize = self.boardView.frame.size.height / 3;
    int columSize = self.boardView.frame.size.width / 3;
    
    for(int row = 0 ; row < 3 ; row++)
    {
        for (int column = 0; column < 3; column ++) {
            
            // Add a imageView to the board
            CGRect frame;
            frame.size.width = columSize;
            frame.size.height = rowSize;
            frame.origin.x = rowSize * row;
            frame.origin.y = columSize * column;
            
            UIImageView * imageView = [[UIImageView alloc]initWithFrame:frame];
           
            
            imageView.tag = 10 * column + row;
            
            [self.boardView addSubview:imageView];
            
            
            imageView.userInteractionEnabled = YES;
            
            [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTouch:)]];
        }
    }

}
- (IBAction)NewGame:(id)sender {
    
    [self.viewModel startNewGame];
    
    [self refreshBoard];
}

- (void) refreshBoard
{
    for (int row = 0; row < 3; row++)
    {
        for (int column = 0; column < 3; column++)
        {
            id mark = [self.viewModel markAtPositionAtRow:row column:column];
            
            UIImageView * imageView = (UIImageView *)[self.boardView viewWithTag:column * 10 + row];
            
            if([mark isEqualToString:FBTicTacToeGameBubble])
            {
                imageView.backgroundColor = [UIColor redColor];
            }
            else if ([mark isEqualToString:FBTicTacToeGameBubble])
            {
                imageView.backgroundColor = [UIColor blueColor];

            }
            else
            {
                imageView.backgroundColor = [UIColor whiteColor];
            }
        }

    }
}

- (void) handleTouch:(UITapGestureRecognizer *)sender
{
    UIView * imageView = sender.view;
    int column = imageView.tag / 10;
    int row = imageView.tag - column;
    
    [self.viewModel markPositionAtRow:row column:column];
    
    [self refreshBoard];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
