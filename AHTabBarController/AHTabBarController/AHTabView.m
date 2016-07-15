//
//  NPTab.m
//  iOrtho
//
//  Created by Arthur Hemmer on 07/08/14.
//  Copyright (c) 2014 Appsss. All rights reserved.
//

//Frameworks
#import <QuartzCore/QuartzCore.h>

//Views
#import "AHTabView.h"
#import "AHSubitemView.h"

//Categories
#import "UIImage+Overlay.h"

@interface AHTabView ()

@property (nonatomic) UIView *thumbnailView;

//The imageview that displays the tab's image
@property (nonatomic) UIImageView *thumbnailImageView;

//The label that displays the tab's title
@property (nonatomic) UILabel *titleLabel;

//Indicates whether the tab is currently selected or not
@property (nonatomic, getter=isSelected) BOOL selected;

@end

@implementation AHTabView

-(nonnull AHTabView *)setup:(nonnull NSString *) title
                      image:(nonnull UIImage *) image {
    self.title = title;
    self.image = image;
    return self;
}

-(nonnull AHTabView *)setup:(nonnull NSString *) title
                 customView:(nonnull UIView *) customView {
    self.title = title;
    self.customView = customView;
    return self;
}

-(void)setSelected:(BOOL)selected
{
    _selected = selected;
    
    if (selected) {
        [self.titleLabel setTextColor:self.selectedColor];
        [self.titleLabel setFont:[UIFont boldSystemFontOfSize:9.f]];
        [self setColorForThumbnail:self.selectedColor];
    } else {
        UIColor *tintColor = [UIColor colorWithWhite:.6f alpha:1.f];
        [self.titleLabel setTextColor:tintColor];
        [self.titleLabel setFont:[UIFont systemFontOfSize:9.f]];
        [self setColorForThumbnail:tintColor];
    }
}

-(void)setColorForThumbnail:(UIColor *)color {
    if (self.image != nil) {
        for (UIView *view in self.thumbnailView.subviews) {
            [view removeFromSuperview];
        }
        [self.thumbnailView addSubview:self.thumbnailImageView];
        self.thumbnailImageView.frame = self.thumbnailView.bounds;
        [self.thumbnailImageView setImage:[self.image imageWithColor:color]];
    } else if (self.customView != nil) {
        for (UIView *view in self.thumbnailView.subviews) {
            [view removeFromSuperview];
        }
        [self.thumbnailView addSubview:self.customView];
        self.customView.frame = self.thumbnailView.bounds;
        [self.customView setTintColor:color];
    }
}

-(void)addSubitem:(AHSubitemView *)subitem
{
    [_subitems addObject:subitem];
    [subitem setTab:self];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    //Some constants
    CGRect frame = self.frame;
    static const float kHorizontalSpacing = 5.f;
    static const float kVerticalSpacing = 1.f;
    static const float kLabelHeight = 13.f;
    
    UIColor *tintColor = self.isSelected ? self.selectedColor : [UIColor colorWithWhite:.6f alpha:1.f];
    
    //Create and setup the thumbnail imageview if it doesn't exist yet
    if (!self.thumbnailView) {
        self.thumbnailView = [[UIView alloc] initWithFrame:CGRectZero];
        [self addSubview:self.thumbnailView];
    }
    
    if (!self.thumbnailImageView) {
        self.thumbnailImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self.thumbnailImageView setContentMode:UIViewContentModeScaleAspectFit];
        [self addSubview:self.thumbnailImageView];
    }
    
    //Set the thumbnail's frame and set the image
    CGRect tFrame = CGRectZero;
    tFrame.size.width = frame.size.width - 2*kHorizontalSpacing;
    tFrame.size.height = frame.size.height - (3*kVerticalSpacing + kLabelHeight) - 11.f;
    tFrame.origin.x = kHorizontalSpacing;
    tFrame.origin.y = 8*kVerticalSpacing;
    [self.thumbnailView setFrame:tFrame];
    [self setColorForThumbnail:tintColor];
    
    //Create and setup the titlelabel if it doesn't exist yet
    if (!self.titleLabel) {
        self.titleLabel = [UILabel new];
        [self.titleLabel setFont:[UIFont systemFontOfSize:9.f]];
        [self.titleLabel setTextColor:[UIColor colorWithWhite:.5f alpha:1.f]];
        [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [self.titleLabel setLineBreakMode:NSLineBreakByTruncatingTail];
        [self addSubview:self.titleLabel];
    }
    
    //Set the titlelabel's frame and text
    CGRect lFrame = CGRectZero;
    lFrame.size.width = frame.size.width - 2*kHorizontalSpacing;
    lFrame.size.height = kLabelHeight;
    lFrame.origin.x = kHorizontalSpacing;
    lFrame.origin.y = frame.size.height - (kVerticalSpacing + kLabelHeight);
    [self.titleLabel setFrame:lFrame];
    [self.titleLabel setText:self.title];
}

#pragma mark - Gestures
-(void)tapGestureRecognized:(UITapGestureRecognizer*)gestureRecognizer
{
    if (gestureRecognizer.state == UIGestureRecognizerStateRecognized) {
        !self.didSelectTab ?: self.didSelectTab(self);
    }
}

#pragma mark - Initialisation
-(void)setup
{
    _subitems = [NSMutableArray new];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                           action:@selector(tapGestureRecognized:)];
    [tapGestureRecognizer setNumberOfTapsRequired:1];
    [tapGestureRecognizer setNumberOfTouchesRequired:1];
    [self addGestureRecognizer:tapGestureRecognizer];
}

-(id)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)dealloc
{
    [self setDidSelectTab:nil];
}

@end
