//
//  BinarySearchTree.m
//  BinarySearchTree
//
//  Created by Markus Feng on 11/2/15.
//  Copyright © 2015 Markus Feng. All rights reserved.
//

#import "BinarySearchTree.h"

@implementation BinarySearchTree

const int maxInt = 2147483647;
const int minInt = -2147483638;

-(void)insert:(int)obj{
    if([self insert:obj inNode:self.root]){
        self.root = [[TreeNode alloc] initWithValue:obj];
    }
}
-(void)delete:(int)obj{
    if([self delete:obj inNode:self.root]){
        TreeNode * node = [self rightBottom:self.root.left];
        node.right = self.root.right;
        self.root = self.root.left;
    }
}
-(void)preorderPrint{
    NSLog(@"%@",[self arrayString:[self preorder]]);
}
-(void)inorderPrint{
    NSLog(@"%@",[self arrayString:[self inorder]]);
}
-(void)postorderPrint{
    NSLog(@"%@",[self arrayString:[self postorder]]);
}
-(NSString*)arrayString:(NSArray*)array{
    NSString * str = @"";
    for(NSNumber * number in array){
        str = [str stringByAppendingString:[NSString stringWithFormat:@"%i, ", [number intValue]]];
    }
    return str;
}
-(int)maxDepth{
    return [self maxDepth:self.root];
}
-(int)minValue{
    return [self minValue:self.root];
}
-(int)maxValue{
    return [self maxValue:self.root];
}
-(bool)contains:(int)obj{
    return [self contains:obj inNode:self.root];
}
-(bool)isBST{
    return [self isBST:self.root min:minInt max:maxInt];
}
-(int)size{
    return [self size:self.root];
}

-(bool)hasPathWithSum:(int)obj{
    return [self hasPathWithSum:obj inNode:self.root];
}

-(NSMutableArray *)preorder{
    NSMutableArray * arr = [[NSMutableArray alloc] init];
    [self preorder:arr inNode:self.root];
    return arr;
}

-(void)preorder:(NSMutableArray *)array inNode:(TreeNode *)node{
    if(node == nil){
        return;
    }
    [array addObject:[[NSNumber alloc]initWithInt: node.value]];
    [self preorder:array inNode:node.left];
    [self preorder:array inNode:node.right];
}

-(NSMutableArray *)inorder{
    NSMutableArray * arr = [[NSMutableArray alloc] init];
    [self inorder:arr inNode:self.root];
    return arr;
}

-(void)inorder:(NSMutableArray *)array inNode:(TreeNode *)node{
    if(node == nil){
        return;
    }
    [self inorder:array inNode:node.left];
    [array addObject:[[NSNumber alloc]initWithInt: node.value]];
    [self inorder:array inNode:node.right];
}

-(NSMutableArray *)postorder{
    NSMutableArray * arr = [[NSMutableArray alloc] init];
    [self postorder:arr inNode:self.root];
    return arr;
}

-(void)postorder:(NSMutableArray *)array inNode:(TreeNode *)node{
    if(node == nil){
        return;
    }
    [self postorder:array inNode:node.left];
    [self postorder:array inNode:node.right];
    [array addObject:[[NSNumber alloc]initWithInt: node.value]];
}


-(bool)insert:(int)obj inNode:(TreeNode *)node{
    if(node == nil){
        return true;
    }
    if(obj < node.value){
        if([self insert:obj inNode:node.left]){
            node.left = [[TreeNode alloc] initWithValue:obj];
        }
        return false;
    }
    else if(obj > node.value){
        if([self insert:obj inNode:node.right]){
            node.right = [[TreeNode alloc] initWithValue:obj];
        }
        return false;
    }
    else{
        //Cannot insert; value already in tree
        return false;
    }
}

-(bool)delete:(int)obj inNode:(TreeNode *)node{
    if(node == nil){
        //Value not found
        return false;
    }
    if(obj < node.value){
        if([self delete:obj inNode:node.left]){
            if(node.left.left == nil){
                node.left = node.left.right;
            }
            else{
                TreeNode * bottom = [self rightBottom:node.left.left];
                bottom.right = node.left.right;
                node.left = node.left.left;
            }
        }
        return false;
    }
    else if(obj > node.value){
        if([self delete:obj inNode:node.right]){
            if(node.right.right == nil){
                node.right = node.right.left;
            }
            else{
                TreeNode * bottom = [self leftBottom:node.right.right];
                bottom.left = node.right.left;
                node.right = node.right.right;
            }
        }
        return false;
    }
    else{
        //Value found; remove it
        return true;
    }
}

-(TreeNode *)leftBottom:(TreeNode *)node{
    if(node == nil){
        return nil;
    }
    TreeNode * bottom = [self leftBottom:node.left];
    if(bottom == nil){
        return node;
    }
    else{
        return bottom;
    }
}

-(TreeNode *)rightBottom:(TreeNode *)node{
    if(node == nil){
        return nil;
    }
    TreeNode * bottom = [self rightBottom:node.right];
    if(bottom == nil){
        return node;
    }
    else{
        return bottom;
    }
}


-(int)size:(TreeNode *)node{
    if(node == nil){
        return 0;
    }
    return [self size:node.left] + [self size:node.right] + 1;
}

-(int)maxDepth:(TreeNode *)node{
    if(node == nil){
        return 0;
    }
    int leftDepth = [self maxDepth:node.left];
    int rightDepth = [self maxDepth:node.right];
    return leftDepth > rightDepth ? leftDepth + 1 : rightDepth + 1;
}

-(int)minValue:(TreeNode *)node{
    if(node == nil){
        //Max int value
        return maxInt;
    }
    if(node.left == nil){
        return node.value;
    }
    return [self minValue:node.left];
}
-(int)maxValue:(TreeNode *)node{
    if(node == nil){
        //Min int value
        return minInt;
    }
    if(node.right == nil){
        return node.value;
    }
    return [self maxValue:node.right];
}
-(bool)contains:(int)obj inNode:(TreeNode *)node{
    if(node == nil){
        return false;
    }
    if(obj < node.value){
        return [self contains:obj inNode:node.left];
    }
    else if(obj > node.value){
        return [self contains:obj inNode:node.right];
    }
    else{
        return true;
    }
}
-(bool)isBST:(TreeNode *)node min:(int)min max:(int)max{
    if(node == nil){
        return true;
    }
    if(node.value <= min || node.value >= max){
        return false;
    }
    if(![self isBST:node.left min:min max:node.value]){
        return false;
    }
    if(![self isBST:node.right min:node.value max:max]){
        return false;
    }
    return true;
}
-(bool)hasPathWithSum:(int)obj inNode:(TreeNode*)node{
    if(node == nil){
        return false;
    }
    if(node.left == nil && node.right == nil){
        return obj == node.value;
    }
    int newSum = obj - node.value;
    return [self hasPathWithSum:newSum inNode:node.left]
    || [self hasPathWithSum:newSum inNode:node.right];
}


@end
