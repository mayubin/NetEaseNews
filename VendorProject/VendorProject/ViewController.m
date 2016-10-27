//
//  ViewController.m
//  VendorProject
//
//  Created by Vokie on 2016/10/27.
//  Copyright © 2016年 Vokie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *idfv = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    NSLog(@"%@", idfv);
//    59AE0211-FE3D-4546-80E3-A1A9D7B8E388
//    F76933C8-9626-4132-8713-E3890F6A8F1E
//    FC092334-52C5-4D8B-813F-5B8D2F05B060
//    BB2C9E27-2558-4028-A7D3-618E48AA11F2
//    89F8C0DB-3DFF-49B3-9C71-8088534A4592
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
