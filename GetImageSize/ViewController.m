//
//  ViewController.m
//  GetImageSize
//
//  Created by wyzw on 2018/9/28.
//  Copyright © 2018年 wyzw. All rights reserved.
//

//简书地址https://www.jianshu.com/p/854dc9c810c9
#import "ViewController.h"
#import "UIImage+ImgSize.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 获取图片url链接获取图片的宽高尺寸
    // 例如以下的png、jpg、gif图片等等
    // http://upload.jianshu.io/collections/images/546902/QQ20171013-100604_2x.png
    // http://img02.tooopen.com/images/20140401/sy_58062548899.jpg
    // https://b-ssl.duitang.com/uploads/item/201502/28/20150228235225_BHEXZ.gif
    
    CGSize size = [UIImage getImageSizeWithURL:[NSURL URLWithString:@"http://upload-images.jianshu.io/upload_images/2822163-70ac87aa2d2199d1.jpg"]];
    NSLog(@"%f  %f", size.width,size.height);
    
    
    
    //   这个方法应用到cell里面会卡顿，建议解决方法：
    //    在拿到需要请求的url数组的时候，就将每个链接的尺寸顺便就给获取出来，然后本地化存储该图片的尺寸，然后再到cell里面根据链接直接在本地取到图片的尺寸，那样在cell里面浏览的时候就不会有卡顿了。
    //获取图片尺寸时先检查是否有缓存(有就不用再获取了)
    //    if (![[NSUserDefaults standardUserDefaults] objectForKey:url]) {
    //        //这里拿到每个图片的尺寸，然后计算出每个cell的高度
    //        CGSize imageSize = [UIImage getImageSizeWithURL:url];
    //        CGFloat imgH = 0;
    //        if (imageSize.height > 0) {
    //            //这里就把图片根据 固定的需求宽度  计算 出图片的自适应高度
    //            imgH = imageSize.height * (SCREEN_WIDTH - 2 * _spaceX) / imageSize.width;
    //        }
    //        //将最终的自适应的高度 本地化处理
    //        [[NSUserDefaults standardUserDefaults] setObject:@(imgH) forKey:url];
    //    }
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
