//
//  AppDelegate.m
//  LabelChess
//
//  Created by qianfeng on 15/7/27.
//  Copyright (c) 2015年 汪岩. All rights reserved.
//

#import "AppDelegate.h"
#import "LabelFactory.h"
//定义一个常数8
#define  Count 8
//因为每一个都是方形的格子，所以屏幕的宽度作为满宽度展示，单个方块的宽度就用Width来表示，由于是方形，高度也可以使用这个常量
#define  Width self.window.frame.size.width/Count
@interface AppDelegate ()

@end

@implementation AppDelegate
-(void)dealloc
{
    self.window=nil;
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window=[[[UIWindow alloc]initWithFrame: [UIScreen mainScreen].bounds] autorelease];
    
    
    UIView *backView=[[UIView alloc]initWithFrame:CGRectMake(0, 20, self.window.frame.size.width, self.window.frame.size.width)];
    
    [self createView:backView];
    [self.window addSubview:backView];
    [backView release];
    self.window.backgroundColor=[UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}
//绘制棋盘
-(void)createView:(UIView *)backView
{
    NSArray *titles=[NSArray arrayWithObjects:@"车",@"马",@"象",@"王",@"后",@"象",@"马",@"车", nil];
    //用来取反向的数组元素
    int k=Count-1;
    //用i来控制行数
    for (int i=0; i<Count; i++) {
        //用j来控制列数
        for (int j=0; j<Count; j++) {
            UILabel *label=nil;
            if (i==1||i==6) {
                //创建棋子兵所在的格子
                label =[LabelFactory createLabelWithTitle:@"兵" frame:CGRectMake(j*Width, i*Width, Width, Width) side:i<2?upSide:downSide];
            }else if(i==0||i==7){
            
                label=[LabelFactory createLabelWithTitle:i<2 ? [titles objectAtIndex:j] :[titles objectAtIndex:k]frame:CGRectMake(j*Width, i*Width, Width, Width) side:i<2 ? upSide:downSide];
                //保证只在第七行label才进行--的操作
                if (i==7) {
                    k--;
                }
            }else{
                //创建空白的没有棋子的格子
                label=[LabelFactory createLabelWithTitle:nil frame:CGRectMake(j*Width, i*Width, Width, Width) side:i<2 ?upSide:downSide];
            }
            //设置格子的背景颜色
            label.backgroundColor=i%2==j%2?[UIColor blackColor]:[UIColor whiteColor];
            [backView addSubview:label];
        }
    }
    
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
