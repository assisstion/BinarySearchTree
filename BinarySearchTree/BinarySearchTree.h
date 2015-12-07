//
//  BinarySearchTree.h
//  BinarySearchTree
//
//  Created by Markus Feng on 11/2/15.
//  Copyright © 2015 Markus Feng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TreeNode.h"


@interface BinarySearchTree : NSObject

@property TreeNode *root;

-(void)insert:(int)obj;
-(void)delete:(int)obj;
-(void)preorderPrint;
-(void)inorderPrint;
-(void)postorderPrint;
-(int)maxDepth;
-(int)minValue;
-(int)maxValue;
-(bool)hasPathWithSum:(int)obj;
-(bool)contains:(int)obj;
-(bool)isBST;
-(int)size;
-(NSMutableArray*)preorder;
-(NSMutableArray*)inorder;
-(NSMutableArray*)postorder;

@end
