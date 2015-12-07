//
//  TreeNode.h
//  BinarySearchTree
//
//  Created by Markus Feng on 11/2/15.
//  Copyright © 2015 Markus Feng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TreeNode : NSObject

@property int value;
@property TreeNode *left;
@property TreeNode *right;

-(instancetype)initWithValue:(int)value;

@end
