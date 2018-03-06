//
//  AppDelegate.m
//  类似QQ主页的侧滑
//
//  Created by 许大成 on 17/5/24.
//  Copyright © 2017年 许大成. All rights reserved.
//

#import "AppDelegate.h"
#import "DCLeftMenuViewController.h"
#import "DCRightMenuViewController.h"
#import "DCFirstViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[[DCFirstViewController alloc] init]];
    DCLeftMenuViewController *leftMenuViewController = [[DCLeftMenuViewController alloc] init];
    DCRightMenuViewController *rightMenuViewController = [[DCRightMenuViewController alloc] init];
    
    RESideMenu *sideMenuViewController = [[RESideMenu alloc] initWithContentViewController:navigationController
                                                                    leftMenuViewController:leftMenuViewController
                                                                   rightMenuViewController:rightMenuViewController];
    sideMenuViewController.backgroundImage = [UIImage imageNamed:@"10.jpg"];
    sideMenuViewController.menuPreferredStatusBarStyle = 1; // UIStatusBarStyleLightContent
    sideMenuViewController.delegate = self;
    sideMenuViewController.contentViewShadowColor = [UIColor blackColor];
    sideMenuViewController.contentViewShadowOffset = CGSizeMake(0, 0);
    sideMenuViewController.contentViewShadowOpacity = 0.6;
    sideMenuViewController.contentViewShadowRadius = 12;
    sideMenuViewController.contentViewShadowEnabled = YES;
    self.window.rootViewController = sideMenuViewController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    return YES;
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

/*
 
 
 ps. 支付集成及注意事项 均在LZMobilePayManager.h中 有提到
 
 // ************支付宝支付****************

 1.导入（AlipaySDK.bundle AlipaySDK.framework）到项目文件库下
 2.在Build Phases选项卡的Link Binary With Libraries中，增加以下依赖：libc++.tbd、libz.tbd、SystemConfiguration.framework、CoreTelephony.framework、QuartzCore.framework、CoreText.framework、CoreGraphics.framework、UIKit.framework、Foundation.framework、CFNetwork.framework、CoreMotion.framework、AlipaySDK.framework
 3.导入#import
- (BOOL)applicationUIApplication *)application
 openURLNSURL *)url
 sourceApplicationNSString *)sourceApplication
 annotationid)annotation {
 if ([url.host isEqualToString"safepay"]) {
 //支付跳转支付宝钱包进行支付，处理支付结果
 [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
 NSLog(@"result = %@",resultDic);
 if (resultDic) {
 [[NSNotificationCenter defaultCenter]postNotificationName"AlipayNotification" object:selfuserInfo:resultDic];
 }
 }];
 //授权跳转支付宝钱包进行支付，处理支付结果
 [[AlipaySDK defaultService] processAuth_V2Result:url standbyCallback:^(NSDictionary *resultDic) {
 NSLog(@"defaultService result = %@",resultDic);
 //解析auth code
 NSString *result = resultDic[@"result"];
 NSString *authCode = nil;
 if (result.length>0) {
 NSArray *resultArr = [result componentsSeparatedByString"&"];
 for (NSString *subResult in resultArr) {
 if (subResult.length > 10 && [subResult hasPrefix"auth_code="]) {
 authCode = [subResult substringFromIndex:10];
 break;
 }
 }
 }
 NSLog(@"授权结果authCode = %@", authCode?"");
 }];
 }
 }
 return YES;
 }
 // NOTE: 9.0以后使用新API接口
 - (BOOL)applicationUIApplication *)app openURLNSURL *)url optionsNSDictionary *)options
 {
 //支付跳转支付宝钱包进行支付，处理支付结果
 [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
 if (resultDic) {
 [[NSNotificationCenter defaultCenter]postNotificationName"AlipayNotification" object:selfuserInfo:resultDic];
 }
 NSLog(@"result = %@",resultDic);
 }];
 //授权跳转支付宝钱包进行支付，处理支付结果
 [[AlipaySDK defaultService] processAuth_V2Result:url standbyCallback:^(NSDictionary *resultDic) {
 NSLog(@"defaultService==result = %@",resultDic);
 //解析auth code
 NSString *result = resultDic[@"result"];
 NSString *authCode = nil;
 if (result.length>0) {
 NSArray *resultArr = [result componentsSeparatedByString"&"];
 for (NSString *subResult in resultArr) {
 if (subResult.length > 10 && [subResult hasPrefix"auth_code="]) {
 authCode = [subResult substringFromIndex:10];
 break;
 }
 }
 }
 NSLog(@"授权结果authCode = %@", authCode?"");
 }];
 }
 return YES;
 }
 4.、点击项目名称，点击“Info”选项卡，在“URL Types”选项中，点击“+”，在“URL Schemes”中输入“alisdkdemo”。“alisdkdemo”来自于文件“APViewController.m”的NSString *appScheme = @“alisdkdemo”;。
 注意：这里的URL Schemes中输入的alisdkdemo，为测试demo，实际商户的app中要填写独立的scheme，建议跟商户的app有一定的标示度，要做到和其他的商户app不重复，否则可能会导致支付宝返回的结果无法正确跳回商户app。
 5.注意'openssl/asn1.h' file not found在Build Setting下Header search paths添加"$(SRCROOT)/工程名/文件夹"
 6.注意如果出现【rsa_private read error : private key is NULL】
 1.修改RSADataSigner中方法formatPrivateKey中
 [result appendString"-----BEGIN PRIVATE KEY-----\n"];
 [result appendString:@"\n-----END PRIVATE KEY-----"];
 为
 [result appendString:@"-----BEGIN RSA PRIVATE KEY-----\n"];
 [result appendString:@"\n-----END RSA PRIVATE KEY-----"];
 */
@end
