//
//  UIViewController+XAExt.m
//  HealthCompanionIOS
//
//  Created by llj on 2024/10/18.
//

#import "UIViewController+XAExt.h"

@implementation UIViewController (XAExt)
+ (void)popGestureClose:(UIViewController *)VC
{
    // 禁用侧滑返回手势
    if ([VC.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        //这里对添加到右滑视图上的所有手势禁用
        for (UIGestureRecognizer *popGesture in VC.navigationController.interactivePopGestureRecognizer.view.gestureRecognizers) {
            popGesture.enabled = NO;
        }
    }
}

+ (void)popGestureOpen:(UIViewController *)VC
{
    // 启用侧滑返回手势
    if ([VC.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        //这里对添加到右滑视图上的所有手势启用
        for (UIGestureRecognizer *popGesture in VC.navigationController.interactivePopGestureRecognizer.view.gestureRecognizers) {
            popGesture.enabled = YES;
        }
    }
}

-(void)jk_popToViewController:(UIViewController *)controller{
//    for (UIViewController *vc in self.navigationController.viewControllers) {
//           if ([vc isKindOfClass:[controller class]]) {
//               vc *detailVC = (vc *)vc;
//               [self.navigationController popToViewController:detailVC animated:NO];
//               break;
//           }
//       }
}
@end
