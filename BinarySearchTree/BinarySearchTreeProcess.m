//
//  BinarySearchTreeProcess.m
//  BinarySearchTree
//
//  Created by Markus Feng on 11/3/15.
//  Copyright © 2015 Markus Feng. All rights reserved.
//

#import "BinarySearchTreeProcess.h"

@implementation BinarySearchTreeProcess

-(instancetype)init{
    self = [super init];
    if(self){
        self.bst = [[BinarySearchTree alloc] init];
    }
    return self;
}

/*
 Commands:
 insert (int)
 delete (int)
 hasPathWithSum (int)
 contains (int)
 isBST (no args)
 depth (no args)
 min (no args)
 max (no args)
 size (no args)
 preorder (no args)
 inorder (no args)
 postorder (no args)
 help (no args)
 quit (no args)
 
 */
-(bool)process{
    char command [50];
    printf("command: ");
    scanf(" %s", command);
    return [self processCommand:[NSString stringWithUTF8String:command]];
}

-(bool)processCommand:(NSString *)command{
    if([command isEqualToString:@"insert"]){
        int arg = [self getCommandArgument];
        [self.bst insert:arg];
        printf("inserted: %i\n", arg);
    }
    else if([command isEqualToString:@"delete"]){
        int arg = [self getCommandArgument];
        [self.bst delete:arg];
        printf("deleted: %i\n", arg);
    }
    else if([command isEqualToString:@"hasPathWithSum"]){
        int arg = [self getCommandArgument];
        bool value = [self.bst hasPathWithSum:arg];
        printf("hasPathWithSum(%i): %s\n", arg, (value ? "true" : "false"));
    }
    else if([command isEqualToString:@"contains"]){
        int arg = [self getCommandArgument];
        bool value = [self.bst contains:arg];
        printf("contains: %s\n", (value ? "true" : "false"));
    }
    else if([command isEqualToString:@"isBST"]){
        bool value = [self.bst isBST];
        printf("isBST: %s\n", (value ? "true" : "false"));
    }
    else if([command isEqualToString:@"depth"]){
        int value = [self.bst maxDepth];
        printf("max depth: %i\n", value);
    }
    else if([command isEqualToString:@"min"]){
        int value = [self.bst minValue];
        printf("min value: %i\n", value);
    }
    else if([command isEqualToString:@"max"]){
        int value = [self.bst maxValue];
        printf("max value: %i\n", value);
    }
    else if([command isEqualToString:@"size"]){
        int value = [self.bst size];
        printf("size: %i\n", value);
    }
    else if([command isEqualToString:@"preorder"]){
        NSMutableArray * value = [self.bst preorder];
        printf("preorder: %s\n", [[self arrayString:value] UTF8String]);
    }
    else if([command isEqualToString:@"inorder"]){
        NSMutableArray * value = [self.bst inorder];
        printf("inorder: %s\n", [[self arrayString:value] UTF8String]);
    }
    else if([command isEqualToString:@"postorder"]){
        NSMutableArray * value = [self.bst postorder];
        printf("postorder: %s\n", [[self arrayString:value] UTF8String]);
    }
    else if([command isEqualToString:@"help"]){
        printf("Commands:\n");
        printf("insert (int)\n");
        printf("delete (int)\n");
        printf("hasPathWithSum (int)\n");
        printf("contains (int)\n");
        printf("isBST (no args)\n");
        printf("depth (no args)\n");
        printf("min (no args)\n");
        printf("max (no args)\n");
        printf("size (no args)\n");
        printf("preorder (no args)\n");
        printf("inorder (no args)\n");
        printf("postorder (no args)\n");
        printf("help (no args)\n");
        printf("quit (no args)\n");
    }
    else if([command isEqualToString:@"quit"]){
        printf("exiting...\n");
        return false;
    }
    else{
        printf("invalid command!\n");
    }
    return true;
}

-(int)getCommandArgument{
    int val = 0;
    printf("argument: ");
    scanf(" %i", &val);
    return val;
}

-(NSString*)arrayString:(NSArray*)array{
    NSString * str = @"";
    for(NSNumber * number in array){
        str = [str stringByAppendingString:[NSString stringWithFormat:@"%i, ", [number intValue]]];
    }
    return str;
}
@end
