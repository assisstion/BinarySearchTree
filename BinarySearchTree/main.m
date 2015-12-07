//
//  main.m
//  BinarySearchTree
//
//  Created by Markus Feng on 11/2/15.
//  Copyright © 2015 Markus Feng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BinarySearchTreeProcess.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        printf("binary tree\n");
        printf("type command \"help\" for more information\n");
        BinarySearchTreeProcess * process = [[BinarySearchTreeProcess alloc] init];
        while([process process]){
            //Continue running
        }
        printf("done!\n");
    }
    return 0;
}