//
//

#import "DFYGProgressHUD.h"
//#import "MBProgressHUD.h"

@interface DFYGProgressHUD ()

@property (nonatomic, weak) MBProgressHUD *progressHUD;

@end

@implementation DFYGProgressHUD

#pragma mark - class method
+ (instancetype)sharedHUD {
    static DFYGProgressHUD *hud = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!hud) {
            hud = [DFYGProgressHUD new];
        }
    });
    return hud;
}

+ (void)showProgressHUDWithMode:(ProgressHUDMode)mode withText:(NSString *)text afterDelay:(NSTimeInterval)delay isTouched:(BOOL)touched inView:(UIView *)view {
    [[DFYGProgressHUD sharedHUD] showProgressHUDWithMode:mode withText:text afterDelay:delay isTouched:touched inView:view];
}

+ (void)showProgressHUDWithMode:(ProgressHUDMode)mode withText:(NSString *)text isTouched:(BOOL)touched inView:(UIView *)view {
    [[DFYGProgressHUD sharedHUD] showProgressHUDWithMode:mode withText:text isTouched:touched inView:view];
}

+ (void)hideProgressHUDAfterDelay:(NSTimeInterval)delay {
    [[DFYGProgressHUD sharedHUD] hideProgressHUDAfterDelay:delay];
}

+ (void)setProgress:(CGFloat)progress {
    [[DFYGProgressHUD sharedHUD] setProgress:progress];
}


#pragma mark - instance && private method
- (void)showProgressHUDWithMode:(ProgressHUDMode)mode withText:(NSString *)text afterDelay:(NSTimeInterval)delay isTouched:(BOOL)touched inView:(UIView *)view {
    [self showProgressHUDWithMode:mode withText:text isTouched:touched inView:view];
    [self.progressHUD hide:YES afterDelay:delay];
}

- (void)showProgressHUDWithMode:(ProgressHUDMode)mode withText:(NSString *)text isTouched:(BOOL)touched inView:(UIView *)view {
    if (view == nil) {
        view = [UIApplication sharedApplication].keyWindow;
    }
    if (self.progressHUD) {
        [self hideProgressHUDAfterDelay:0];
    }
    self.progressHUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    self.progressHUD.userInteractionEnabled = !touched;
    if (!touched) {
        self.progressHUD.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.1f];
    }
    self.progressHUD.labelText = text;
    self.progressHUD.removeFromSuperViewOnHide = YES;
    switch (mode) {
        case ProgressHUDModeActivityIndicator:
            self.progressHUD.mode = MBProgressHUDModeIndeterminate;
            break;
        case ProgressHUDModeOnlyText:
            self.progressHUD.mode = MBProgressHUDModeText;
            break;
        case ProgressHUDModeProgress:
            self.progressHUD.mode = MBProgressHUDModeAnnularDeterminate;
            break;
        default:
            break;
    }
}

- (void)hideProgressHUDAfterDelay:(NSTimeInterval)delay {
    [self.progressHUD hide:YES afterDelay:delay];
    self.progressHUD = nil;
}

- (void)setProgress:(CGFloat)progress {
    self.progressHUD.progress = progress;
    if (progress >= 1 || progress < 0) {
        [self.progressHUD hide:YES];
    }
}



@end
