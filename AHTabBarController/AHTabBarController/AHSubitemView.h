//
//  NPSubItem.h
//  iOrtho
//
//  Created by Arthur Hemmer on 07/08/14.
//  Copyright (c) 2014 Appsss. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AHTabView;

@interface AHSubitemView : UIView

typedef UIViewController* _Nonnull (^ViewControllerBlock)();

/**
 The title that is displayed in the menu for this subitem.
 */
@property (nonatomic) NSString * _Nonnull title;

/**
 The icon image for the subitem.
 */
@property (nonatomic) UIImage * _Nullable image;

/**
 The custom icon view for the subitem.
 */
@property (nonatomic) UIView * _Nullable customView;

/**
 The view controller for this subitem
 */
@property (nonatomic) UIViewController * _Nullable viewController;

/**
 The block to load the view controller for this tab lazily.
 */
@property (nonatomic) ViewControllerBlock controllerBlock;

/**
 A callback block for when the user taps the subitem.
 */
@property (nonatomic, copy) void (^didSelectSubitem)(AHSubitemView *tab);

/**
 The color that the title label and icon image will have when the view is selected.
 */
@property (nonatomic) UIColor *selectedColor;

/**
 The AHTabView instance under which this subitem is visible in the menu.
 */
@property (nonatomic) AHTabView *tab;

/**
 Animate to a selected/deselected state.
 */
-(void)setSelected:(BOOL)selected;


-(nonnull AHSubitemView *)setup:(nonnull NSString *) title
                          image:(nonnull UIImage *) image
                controllerBlock:(nonnull ViewControllerBlock) controllerBlock;

-(nonnull AHSubitemView *)setup:(nonnull NSString *) title
                     customView:(nonnull UIView *) customView
                controllerBlock:(nonnull ViewControllerBlock) controllerBlock;

@end
