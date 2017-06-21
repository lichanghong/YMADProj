//
//  YMADManager.m
//  YMAD
//
//  Created by lichanghong on 6/20/17.
//  Copyright © 2017 lichanghong. All rights reserved.
//

#import "YMADManager.h"
#import "UMVideoAd.h"

@implementation YMADManager

+ (instancetype)defaultManager
{
    static YMADManager *manager = nil;
    @synchronized (self) {
        if (!manager) {
            manager = [[YMADManager alloc]init];
        }
    }
    return manager;
}

+ (void)startWithAppID:(NSString *)appid appKey:(NSString *)appkey
{
    [UMVideoAd initAppID:appid appKey:appkey cacheVideo:YES];
}

+ (void)showADInController:(UIViewController*)VC
{
    //开启非wifi预缓存视频文件
    [UMVideoAd videoDownloadOnUNWifi:YES];
    
    [UMVideoAd videoCloseAlertViewWhenWantExit:NO];
    /*
     isHaveVideoStatue的值目前有两个
     0：有视频可以播放
     1：暂时没有可播放视频
     2：网络状态不好
     */
    /*
     isHaveVideoStatue
     0：there are videos for playing
     1：there are no videos for playing
     2：network error
     */
    [UMVideoAd videoHasCanPlayVideo:^(int isHaveVideoStatue){
        NSLog(@"is have video to play：%d",isHaveVideoStatue);
        if (isHaveVideoStatue == 0) {
            UMBannerView *bannerView = [UMVideoAd videoBannerPlayerFrame:CGRectMake(0, VC.view.frame.size.height - 55, VC.view.frame.size.width, 50) videoBannerPlayCloseCallBackBlock:^(BOOL isLegal){
                NSLog(@"关闭banner");
                NSLog(@"close banner");
            }];
            [VC.view addSubview:(id)bannerView];
            //
            [UMVideoAd videoPlay:VC videoSuperView:VC.view videoPlayerFrame:CGRectMake(0, VC.view.frame.size.height/2, VC.view.frame.size.width, (VC.view.frame.size.width)*4/7) videoPlayFinishCallBackBlock:^(BOOL isFinishPlay){
                if (isFinishPlay) {
                    NSLog(@"视频播放结束");
                    NSLog(@"finish video play");
                    
                }else{
                    NSLog(@"中途退出");
                    NSLog(@"video drop out");
                }
                
            } videoPlayConfigCallBackBlock:^(BOOL isLegal){
                NSString *message = @"";
                if (isLegal) {
                    message = @"此次播放有效 is valid";
                }else{
                    message = @"此次播放无效 is invalid ";
                }
                NSLog(@"是否有效：%@",message);
                NSLog(@"is valid：%@",message);
            }];

        }
    }];
}

@end
