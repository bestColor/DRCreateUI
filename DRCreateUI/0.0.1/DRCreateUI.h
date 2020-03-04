//
//  DRCreateUI.h
//  DRCreateUI_Example
//
//  Created by 李风 on 2020/3/4.
//  Copyright © 2020 3257468284@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DRCreateUI : NSObject

/** 创建 button(标题 + 图片 或者 只有标题) */
+ (UIButton *)buttonWithTitle:(NSString *)title
                   titleColor:(UIColor *)titleColor
                         font:(float)font
                        image:(UIImage * _Nullable)image
                       target:(id)target
                          sel:(SEL)sel;

/** 创建 button（只有图片）*/
+ (UIButton *)buttonWithImage:(UIImage *)image
                       target:(id)target
                          sel:(SEL)sel;


/** 创建 label 默认配置(居左，白色字体，透明背景色，CGRectZero) */
+ (UILabel *)labelWithText:(NSString *)text
                      font:(float)font;

/** 创建 label 默认配置(白色字体，透明背景色，CGRectZero)  */
+ (UILabel *)labelWithText:(NSString *)text
                      font:(float)font
             textAlignment:(NSTextAlignment)textAlignment;

/** 创建 label 默认配置(透明背景色，CGRectZero)  */
+ (UILabel *)labelWithText:(NSString *)text
                      font:(float)font
             textAlignment:(NSTextAlignment)textAlignment
                 textColor:(UIColor *)textColor;

/** 创建 label */
+ (UILabel *)labelWithFrame:(CGRect)frame
                       text:(NSString *)text
                       font:(float)font
              textAlignment:(NSTextAlignment)textAlignment
                  textColor:(UIColor *)textColor
            backgroundColor:(UIColor *)backgroundColor;

/** 创建view */
+ (UIView *)viewWithBackgroundColor:(UIColor *)backgroundColor;

/** 创建 imageView 默认配置（UIViewContentModeScaleAspectFit，clearColor, CGRectZero） */
+ (UIImageView *)imageViewWithImageName:(NSString *)imageName;

/** 创建 imageView */
+ (UIImageView *)imageViewWithFrame:(CGRect)frame
                          imageName:(NSString *)imageName
                              model:(UIViewContentMode)model
                    backgroundColor:(UIColor *)backgroundColor
                             enable:(BOOL)enable;


/** 创建 scrollView */
+ (UIScrollView *)scrollViewWithFrame:(CGRect)frame
                      backgroundColor:(UIColor *)backgroundColor
                             delegate:(id _Nullable)delegate;

/** 创建 searchBar */
+ (UISearchBar *)searchBarWithFrame:(CGRect)frame
                           delegate:(id _Nonnull)delegate
                       barTintColor:(UIColor *_Nullable)barTintColor
                          tintColor:(UIColor *_Nullable)tintColor;

/** 创建 textField */
+ (UITextField *)textFieldWithPlaceHolder:(NSString *)placeHolder
                                     font:(float)font
                                 delegate:(id)delegate;

+ (UITextField *)textFieldWithFrame:(CGRect)frame
                    backgroundColor:(UIColor *)backgroundColor
                           delegate:(id _Nonnull)delegate
                               font:(float)font
                          textColor:(UIColor *)textColor
                      textAlignment:(NSTextAlignment)textAlignment
                               text:(NSString *)text
                        placeHolder:(NSString *)placeHolder;

/** 创建 textView */
+ (UITextView *)textViewWithPlaceHolder:(NSString *)placeHolder
                                     font:(float)font
                                 delegate:(id)delegate;

+ (UITextView *)textViewWithFrame:(CGRect)frame
                         delegate:(id _Nonnull)delegate
                             text:(NSString *)text
                        textColor:(UIColor *_Nullable)textColor
                             font:(float)font
                  backgroundColor:(UIColor *_Nullable)backgroundColor
                      placeHolder:(NSString *)placeHolder;

/** 创建 tableView */
+ (UITableView *)tableViewWithFrame:(CGRect)frame
                           delegate:(id _Nonnull)delegate
                  registerCellClass:(Class)registerCellClass;

/** 创建 collectionView */
+ (UICollectionView *)collectionViewithFrame:(CGRect)frame
                                      layout:(UICollectionViewLayout *)layout
                                    delegate:(id _Nonnull)delegate
                           registerCellClass:(Class)registerCellClass;

/// 创建segmentedControl
+ (UISegmentedControl *)segmentedControlWithFrame:(CGRect)frame
                                            items:(NSArray *)items
                           selectedSegmentedIndex:(NSInteger)selectedSegmentedIndex
                                        tintColor:(UIColor *)tintColor
                                           target:(id _Nonnull)target
                                              sel:(SEL)sel;

@end

NS_ASSUME_NONNULL_END
