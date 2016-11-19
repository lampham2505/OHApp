//
//  OneHealthApp-Bridging-Header.h
//  OneHealthApp
//
//  Created by Viet Anh on 11/16/16.
//  Copyright © 2016 OneHealth. All rights reserved.
//

#ifndef OneHealthApp_Bridging_Header_h
#define OneHealthApp_Bridging_Header_h
#import "SWRevealViewController.h"
#import <JSQMessagesViewController/JSQMessages.h>
#import <JSQMessagesViewController/JSQMessagesBubbleImageFactory.h>
#import <JSQMessagesViewController/JSQMessagesBubbleImage.h>
#import <JSQMessagesViewController/JSQMessagesAvatarImage.h>
#import <JSQMessagesViewController/JSQMessagesAvatarImageFactory.h>
#import <JSQMessagesViewController/JSQMessagesToolbarButtonFactory.h>
#import "APIError.h"
#import "Utils.h"
#define status_code_failed 0
#define status_code_success 1
#define status_code_token -1
#define status_code_null 2
#define status_code_duplicate 3
#define key_status_error "EMStatusCode"
#define key_status_message "Message"
#define key_status_list "List"
#endif /* OneHealthApp_Bridging_Header_h */
