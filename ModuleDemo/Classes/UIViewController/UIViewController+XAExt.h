//
//  UIViewController+XAExt.h
//  HealthCompanionIOS
//
//  Created by llj on 2024/10/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (XAExt)
+ (void)popGestureClose:(UIViewController *)VC;
+ (void)popGestureOpen:(UIViewController *)VC;
-(void)jk_popToViewController:(UIViewController *)vc;
@end

NS_ASSUME_NONNULL_END
