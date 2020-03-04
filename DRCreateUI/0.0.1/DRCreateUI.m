//
//  DRCreateUI.m
//  DRCreateUI_Example
//
//  Created by 李风 on 2020/3/4.
//  Copyright © 2020 3257468284@qq.com. All rights reserved.
//

#import "DRCreateUI.h"
#import <objc/runtime.h>
#import <objc/message.h>

#define kCreateUI_Default_text_color [UIColor blackColor]
#define kCreateUI_Default_backgroundColor [UIColor whiteColor]

@implementation DRCreateUI

+ (UIButton *)buttonWithTitle:(NSString *)title
                   titleColor:(UIColor *)titleColor
                         font:(float)font
                        image:(UIImage * _Nullable)image
                       target:(id)target
                          sel:(SEL)sel {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title.length ? title : @"" forState:UIControlStateNormal];
    [button setTitleColor:titleColor ? titleColor : kCreateUI_Default_text_color forState:UIControlStateNormal];
    [button setTitleColor:[button.titleLabel.textColor colorWithAlphaComponent:0.3] forState:UIControlStateHighlighted];
    [button.titleLabel setFont:[UIFont systemFontOfSize:font]];
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    if (image) [button setImage:image forState:UIControlStateNormal];
    return button;
}

/** 创建 button（图片）*/
+ (UIButton *)buttonWithImage:(UIImage *)image
                       target:(id)target
                          sel:(SEL)sel {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (UILabel *)labelWithText:(NSString *)text
                      font:(float)font {
    return [DRCreateUI labelWithText:text font:font textAlignment:NSTextAlignmentLeft];
}

+ (UILabel *)labelWithText:(NSString *)text
                      font:(float)font
             textAlignment:(NSTextAlignment)textAlignment {
    return [DRCreateUI labelWithText:text font:font textAlignment:textAlignment textColor:[UIColor whiteColor]];
}

+ (UILabel *)labelWithText:(NSString *)text
                      font:(float)font
             textAlignment:(NSTextAlignment)textAlignment
                 textColor:(UIColor *)textColor {
    return [DRCreateUI labelWithFrame:CGRectZero text:text font:font textAlignment:textAlignment textColor:textColor backgroundColor:[UIColor clearColor]];
}

+ (UILabel *)labelWithFrame:(CGRect)frame
                       text:(NSString *)text
                       font:(float)font
              textAlignment:(NSTextAlignment)textAlignment
                  textColor:(UIColor *)textColor
            backgroundColor:(UIColor *)backgroundColor {
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = text.length ? text : @"";
    label.font = [UIFont systemFontOfSize:font];
    label.textColor = textColor ? textColor : kCreateUI_Default_text_color;
    label.textAlignment = textAlignment;
    label.backgroundColor = backgroundColor ? backgroundColor : kCreateUI_Default_backgroundColor;
    return label;
}

+ (UIView *)viewWithBackgroundColor:(UIColor *)backgroundColor {
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    view.backgroundColor = backgroundColor ? backgroundColor : kCreateUI_Default_backgroundColor;
    return view;
}

+ (UIImageView *)imageViewWithImageName:(NSString *)imageName {
    return [DRCreateUI imageViewWithFrame:CGRectZero imageName:imageName model:UIViewContentModeScaleAspectFit backgroundColor:[UIColor clearColor] enable:NO];
}

/// 创建 imageView
+ (UIImageView *)imageViewWithFrame:(CGRect)frame
                          imageName:(NSString *)imageName
                              model:(UIViewContentMode)model
                    backgroundColor:(UIColor *)backgroundColor
                             enable:(BOOL)enable {
    UIImage *image = imageName.length ? [UIImage imageNamed:imageName] : nil;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = image ? image : nil;
    imageView.contentMode = model ? model : UIViewContentModeScaleAspectFit;
    imageView.backgroundColor = backgroundColor ? backgroundColor : kCreateUI_Default_backgroundColor;
    imageView.userInteractionEnabled = enable;
    return imageView;
}

+ (UIScrollView *)scrollViewWithFrame:(CGRect)frame
                      backgroundColor:(UIColor *)backgroundColor
                             delegate:(id _Nullable)delegate {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:frame];
    scrollView.backgroundColor = backgroundColor ? backgroundColor : kCreateUI_Default_backgroundColor;
    scrollView.delegate = delegate;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    return scrollView;
}

/**    UISearchBarDelegate 的例子
 
 /// 横竖屏切换的时候要修改图片的偏移
 - (void)viewDidLayoutSubviews
 {
 [self.view layoutIfNeeded];
 
 if (self.searchBar.text.length) {
 [self.searchBar setPositionAdjustment:UIOffsetMake(0, 0) forSearchBarIcon:UISearchBarIconSearch];
 } else {
 [self.searchBar setPositionAdjustment:UIOffsetMake((_searchBar.frame.size.width - 110)/2.0, 0) forSearchBarIcon:UISearchBarIconSearch];
 }
 }
 
 #pragma mark - UISearchBarDelegate
 - (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
 {
 [_searchBar setPositionAdjustment:UIOffsetMake(0, 0) forSearchBarIcon:UISearchBarIconSearch];
 
 searchBar.showsCancelButton = YES;
 return YES;
 }
 
 - (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
 {
 if (_searchBar.text.length <= 0) {
 [_searchBar setPositionAdjustment:UIOffsetMake((_searchBar.frame.size.width - 110)/2.0, 0) forSearchBarIcon:UISearchBarIconSearch];
 }
 
 NSString *searchText = searchBar.text;
 
 if (searchText.length) {
 NSLog(@"进行搜索,根据搜索结果显示正确数据，如果无数据，久显示初始化数据");
 
 } else {
 NSLog(@"没有进行搜索，界面恢复初始化数据");
 
 }
 
 searchBar.showsCancelButton = NO;
 return YES;
 }
 
 - (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
 {
 [searchBar resignFirstResponder];
 }
 
 - (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
 {
 searchBar.text = @"";
 
 [searchBar resignFirstResponder];
 }
 */

+ (UISearchBar *)searchBarWithFrame:(CGRect)frame
                           delegate:(id _Nonnull)delegate
                       barTintColor:(UIColor *_Nullable)barTintColor
                          tintColor:(UIColor *_Nullable)tintColor {
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:frame];
    searchBar.returnKeyType = UIReturnKeySearch;
    searchBar.barTintColor = barTintColor ? barTintColor : [UIColor whiteColor];
    searchBar.tintColor = tintColor ? tintColor : [UIColor grayColor];
    searchBar.placeholder = @"点击搜索";
    searchBar.delegate = delegate;
    return searchBar;
}

+ (UITextField *)textFieldWithPlaceHolder:(NSString *)placeHolder
                                     font:(float)font
                                 delegate:(id)delegate {
    return [DRCreateUI textFieldWithFrame:CGRectZero backgroundColor:[UIColor clearColor] delegate:delegate font:font textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft text:@"" placeHolder:placeHolder];
}

+ (UITextField *)textFieldWithFrame:(CGRect)frame
                    backgroundColor:(UIColor *)backgroundColor
                           delegate:(id _Nonnull)delegate
                               font:(float)font
                          textColor:(UIColor *)textColor
                      textAlignment:(NSTextAlignment)textAlignment
                               text:(NSString *)text
                        placeHolder:(NSString *)placeHolder {
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.backgroundColor = backgroundColor ? backgroundColor : kCreateUI_Default_backgroundColor;
    textField.delegate = delegate;
    textField.font = [UIFont systemFontOfSize:font];
    
    if (placeHolder.length) {
        NSDictionary *attrDict = @{NSForegroundColorAttributeName:[UIColor lightGrayColor]};
        [textField setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:placeHolder attributes:attrDict]];
    }
    
    textField.text = text.length ? text : @"";
    textField.textColor = textColor ? textColor : kCreateUI_Default_text_color;
    textField.textAlignment = textAlignment;
    [textField setReturnKeyType:UIReturnKeyDone];
    // 关闭首字母大写
    [textField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    // 关闭自动联想
    [textField setAutocorrectionType:UITextAutocorrectionTypeNo];
    return textField;
}

+ (UITextView *)textViewWithPlaceHolder:(NSString *)placeHolder
                                   font:(float)font
                               delegate:(id)delegate {
    return [DRCreateUI textViewWithFrame:CGRectZero delegate:delegate text:@"" textColor:[UIColor whiteColor] font:font backgroundColor:[UIColor clearColor] placeHolder:placeHolder];
}

+ (UITextView *)textViewWithFrame:(CGRect)frame
                         delegate:(id _Nonnull)delegate
                             text:(NSString *)text
                        textColor:(UIColor *_Nullable)textColor
                             font:(float)font
                  backgroundColor:(UIColor *_Nullable)backgroundColor
                      placeHolder:(NSString *)placeHolder {
    UITextView *textView = [[UITextView alloc] initWithFrame:frame];
    textView.delegate = delegate;
    textView.text = text;
    textView.textColor = textColor ? textColor : kCreateUI_Default_text_color;
    textView.font = [UIFont systemFontOfSize:font];
    textView.backgroundColor = backgroundColor ? backgroundColor : kCreateUI_Default_backgroundColor;
    textView.returnKeyType = UIReturnKeyDone;
    
    // 关闭首字母大写
    [textView setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    // 关闭自动联想
    [textView setAutocorrectionType:UITextAutocorrectionTypeNo];
    
    if (placeHolder && placeHolder.length) {
        BOOL isHasPlaceHolderLabel = NO;
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList([UITextView class], &count);
        for (int i = 0; i < count; i++) {
            Ivar ivar = ivars[i];
            const char *name = ivar_getName(ivar);
            NSString *objcName = [NSString stringWithUTF8String:name];
            if ([objcName isEqualToString:@"_placeholderLabel"]) {
                isHasPlaceHolderLabel = YES;
                break;
            }
        }
        
        if (isHasPlaceHolderLabel) {
            UILabel *placeHolderLabel = [[UILabel alloc] init];
            placeHolderLabel.text = placeHolder;
            placeHolderLabel.numberOfLines = 0;
            placeHolderLabel.textColor = [UIColor lightGrayColor];
            [placeHolderLabel sizeToFit];
            [textView addSubview:placeHolderLabel];
            placeHolderLabel.font = textView.font;
            [textView setValue:placeHolderLabel forKey:@"_placeholderLabel"];
        }
    }
    return textView;
}

+ (UITableView *)tableViewWithFrame:(CGRect)frame
                           delegate:(id _Nonnull)delegate
                  registerCellClass:(Class)registerCellClass {
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    tableView.delegate = delegate;
    tableView.dataSource = delegate;
    tableView.estimatedRowHeight = 0;
    tableView.estimatedSectionHeaderHeight = 0;
    tableView.estimatedSectionFooterHeight = 0;
    tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    [tableView setSeparatorInset:UIEdgeInsetsZero];
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [tableView registerClass:[registerCellClass class] forCellReuseIdentifier:NSStringFromClass([registerCellClass class])];
    tableView.tableFooterView = [UIView new];
    
    if (@available(iOS 11.0, *)) {
        tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        
    }

    return tableView;
}

/** 创建 collectionView */
+ (UICollectionView *)collectionViewithFrame:(CGRect)frame
                                      layout:(UICollectionViewFlowLayout *)layout
                                    delegate:(id _Nonnull)delegate
                           registerCellClass:(Class)registerCellClass {
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
    collectionView.delegate = delegate;
    collectionView.dataSource = delegate;
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    [collectionView registerClass:[registerCellClass class] forCellWithReuseIdentifier:NSStringFromClass([registerCellClass class])];
    
    if (@available(iOS 11.0, *)) {
        collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        
    }
    return collectionView;
}

+ (UISegmentedControl *)segmentedControlWithFrame:(CGRect)frame
                                            items:(NSArray *)items
                           selectedSegmentedIndex:(NSInteger)selectedSegmentedIndex
                                        tintColor:(UIColor *)tintColor
                                           target:(id _Nonnull)target
                                              sel:(SEL)sel {
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:items];
    segmentedControl.frame = frame;
    segmentedControl.selectedSegmentIndex = selectedSegmentedIndex;
    segmentedControl.tintColor = tintColor ? tintColor : [UIColor grayColor];
    [segmentedControl addTarget:target action:sel forControlEvents:UIControlEventValueChanged];

    NSDictionary *attrDict = @{NSFontAttributeName:[UIFont systemFontOfSize:15]};
    [segmentedControl setTitleTextAttributes:attrDict forState:UIControlStateNormal];

    return segmentedControl;
}


@end
