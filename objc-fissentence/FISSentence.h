//
//  FISSentence.h
//  objc-fissentence
//
//  Created by Kenneth Cooke on 6/10/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISSentence : NSObject

@property (readonly,nonatomic) NSString *sentence;
@property (strong,nonatomic) NSMutableArray *words;
@property (strong,nonatomic) NSString *punctuation;

-(void)addWord:(NSString *)word;
-(void)addWords:(NSArray *)words withPunctuation:(NSString *)pucntuation;
-(void)removeWordAtIndex:(NSUInteger)index;
-(void)insertWord:(NSString *)word atIndex:(NSUInteger)index;
-(void)replacePunctuationWithPunctuation:(NSString *)punctuation;
-(void)replaceWordAtIndex:(NSUInteger)index withWord:(NSString *)word;








@end
