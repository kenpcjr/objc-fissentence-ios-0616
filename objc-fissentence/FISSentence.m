//
//  FISSentence.m
//  objc-fissentence
//
//  Created by Kenneth Cooke on 6/10/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import "FISSentence.h"

@interface FISSentence ()

@property (nonatomic, readwrite) NSString *sentence;

-(void)assembleSentence;

-(BOOL)validWord:(NSString *)word;

-(BOOL)validPunctuation:(NSString *)punctutation;

-(BOOL)validIndex:(NSUInteger)index;

@end

@implementation FISSentence

-(void)assembleSentence{
    NSString *assembledSentence = @"";
    assembledSentence = [self.words componentsJoinedByString:@" "];
    assembledSentence = [ assembledSentence stringByAppendingString:self.punctuation];
    
    self.sentence = assembledSentence;
    NSLog(@"%@", assembledSentence);
}

-(BOOL)validWord:(NSString *)word{
    if ([word length] == 0 || [word isEqualToString:@" "]) {
        return NO;
    }
    return YES;
}

-(BOOL)validPunctuation:(NSString *)punctuation{
    NSArray *punctToCheckAgainst = @[@".",@"!",@"?",@",",@";",@":",@"-"];
    if ([punctToCheckAgainst containsObject:punctuation]) {
        return YES;
    }
    return NO;
}

-(BOOL)validIndex:(NSUInteger)index{
    if (index < [self.words count]) {
        return YES;
    }
    return NO;
}

-(void)addWord:(NSString *)word{
    
    if ([self validWord:word]) {
        [self.words addObject:word];
    }
    [self assembleSentence];
    
}

-(void)addWords:(NSArray *)words withPunctuation:(NSString *)punctuation{
    
    if (words != 0 && [self validPunctuation:punctuation]) {
        for (NSUInteger i = 0; i < [words count]; i++) {
            if ([self validWord:words[i]]) {
                [self.words addObject:words[i]];
                self.punctuation = punctuation;
                [self assembleSentence];
            }
            
        }
        
    }
    
}

-(void)removeWordAtIndex:(NSUInteger)index{
    if ([self validIndex:index]) {
        [self.words removeObjectAtIndex:index];
        [self assembleSentence];
    }
    
    
    
}

-(void)insertWord:(NSString *)word atIndex:(NSUInteger)index{
    
    if ([self validIndex:index] && [self validWord:word]) {
        [self.words insertObject:word atIndex:index];
    }
    [self assembleSentence];
    
}

-(void)replacePunctuationWithPunctuation:(NSString *)punctuation{
    if ([self validPunctuation: punctuation]) {
        self.punctuation = punctuation;
    }
    [self assembleSentence];
    
}

-(void)replaceWordAtIndex:(NSUInteger)index withWord:(NSString *)word{
    if ([self validWord:word] && [self validIndex:index]) {
        [self.words replaceObjectAtIndex:index withObject:word];
    }
    [self assembleSentence];
    
}

@end
