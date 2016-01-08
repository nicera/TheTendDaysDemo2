//
//  PictureVC.m
//  TheTendDaysDemo2
//
//  Created by student on 15-10-12.
//  Copyright (c) 2015年 student. All rights reserved.
//

#import "PictureVC.h"

@interface PictureVC ()
@property (nonatomic,strong) UIImageView *imageShow;
@property (nonatomic,strong) UIButton *btnSelect;
@end

@implementation PictureVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.imageShow =[[UIImageView alloc] initWithFrame:CGRectMake(0, 20, 320, 200)];
        self.btnSelect=[[UIButton alloc] initWithFrame:CGRectMake(140, 250, 100, 40)];
        [self.btnSelect setTitle:@"选择图片" forState:UIControlStateNormal];
        [self.btnSelect setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self.btnSelect addTarget:self action:@selector(selectPicture) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:self.imageShow];
        [self.view addSubview:self.btnSelect];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)selectPicture
{
    UIImagePickerController *pick=[[UIImagePickerController alloc] init];
    pick.delegate=self;
    [self presentViewController:pick animated:YES completion:NULL];
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    self.imageShow.image=[info objectForKey:UIImagePickerControllerOriginalImage];
    //NSLog(@"info=%@",info);
    [self dismissViewControllerAnimated:YES completion:NULL];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
