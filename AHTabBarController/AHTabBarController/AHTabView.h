//
//  NPTab.h
//  iOrtho
//
//  Created by Arthur Hemmer on 07/08/14.
//  Copyright (c) 2014 Appsss. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AHSubitemView;

@interface AHTabView : UIView


/**
 Contains AHSubitemView instances that will be showed wehenever this tab is tapped. If the tab only contains one item, no extra menu will be shown and the user will directly see the subitem's viewcontroller.
 */
@property (nonatomic, readonly) NSMutableArray *subitems;

/**
 The tab's title.
 */
@property (nonatomic) NSString *title;

/**
 The tab's icon image.
 */
@property (nonatomic) UIImage *image;

/**
 The tab's custom view.
 */
@property (nonatomic) UIView *customView;

/**
 A callback block for when the user taps the tab.
 */
@property (nonatomic, copy) void (^didSelectTab)(AHTabView *tab);

/**
 The color that the title label and icon image will have when the tab is selected.
 */
@property (nonatomic) UIColor *selectedColor;

/**
 The color that the title label and icon image will have when the tab is deselected.
 */
@property (nonatomic) UIColor *deselectedColor;

/**
 The background color that indicates the selected state of tabs.
 */
@property (nonatomic) UIColor *selectedBackgroundColor;

/**
 The background color that indicates the deselected state of tabs.
 */
@property (nonatomic) UIColor *deselectedBackgroundColor;

/**
 The font size of the title label.
 */
@property (nonatomic) CGFloat fontSize;

/**
 Adds a subitem to the subitems array.
 */
-(void)addSubitem:(AHSubitemView *)subitem;

/**
 Animate to a selected/deselected state.
 */
-(void)setSelected:(BOOL)selected;

-(nonnull AHTabView *)setup:(nonnull NSString *) title
                      image:(nonnull UIImage *) image;

-(nonnull AHTabView *)setup:(nonnull NSString *) title
                 customView:(nonnull UIView *) customView;

@end
