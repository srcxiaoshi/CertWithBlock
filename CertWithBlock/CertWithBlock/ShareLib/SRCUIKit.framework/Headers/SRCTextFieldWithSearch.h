//
//  TextFieldWithSearch.h
//  SRCUIKit
//
//  Created by 史瑞昌 on 2018/9/15.
//  Copyright © 2018年 史瑞昌. All rights reserved.
//

#import <UIKit/UIKit.h>

#define NAV_BAR_SEARCH_TEXT_HEIGHT      26
#define NAV_BAR_SEARCH_TEXT_WIDTH      VIEW_WIDTH-15*3+30

#define NAV_BAR_SEARCH_TEXT_EDGE_LEFT      15
#define NAV_BAR_SEARCH_TEXT_EDGE_BOTTOM      9



@protocol SRCTextFieldDelegateWithSearch <NSObject>

@optional
- (BOOL)searchTextFieldShouldBeginEditing:(UITextField *)textField;        // return NO to disallow editing.
- (void)searchTextFieldDidBeginEditing:(UITextField *)textField;           // became first responder
- (BOOL)searchTextFieldShouldEndEditing:(UITextField *)textField;          // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
- (void)searchTextFieldDidEndEditing:(UITextField *)textField;             // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called


- (BOOL)searchTextField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;   // return NO to not change text

- (BOOL)searchTextFieldShouldClear:(UITextField *)textField;               // called when clear button pressed. return NO to ignore (no notifications)
- (BOOL)searchTextFieldShouldReturn:(UITextField *)textField;              // called when 'return' key pressed. return NO to ignore.

@end

@interface SRCTextFieldWithSearch : UITextField <UITextFieldDelegate>

@property(nonatomic,weak)id <SRCTextFieldDelegateWithSearch> searchEditDelegate;

@end
