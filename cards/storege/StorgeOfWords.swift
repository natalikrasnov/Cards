//
//  StorgeOfNamesImages.swift
//  LearnApp
//
//  Created by hyperactive on 28/11/2018.
//  Copyright © 2018 hyperactive. All rights reserved.
//

import UIKit
import Localize_Swift

class StorgeOfWords {
    
    static var words = ["dog","water","love","wine","cat","house","family"]
    
    static var wordPerGameRound = ""
    static var translate = ""
    static var countRounds = 0
    static var usedThatWords:[String] = []
    static var lessonNumber = 0
    static var optionalTranslate:[String]=[]
    
    class func youCanUseWithThisWords(){
        StorgeOfWords.usedThatWords = []
        if StorgeOfWords.lessonNumber == 1 {
            StorgeOfWords.countRounds = StorgeOfWords.words.count/2
             while StorgeOfWords.usedThatWords.count < StorgeOfWords.words.count/2 {
                for word in StorgeOfWords.words{
                    if StorgeOfWords.usedThatWords.count < StorgeOfWords.words.count/2 {
                        StorgeOfWords.usedThatWords.append(word)
                    }
                }
            }
            if StorgeOfWords.countRounds<3{
                while StorgeOfWords.countRounds < 3 {
                    for index in StorgeOfWords.words.count/2..<StorgeOfWords.words.count{   //check
                        StorgeOfWords.usedThatWords.append(StorgeOfWords.words[index])
                        StorgeOfWords.countRounds+=1
                    }
                }
            }
        }else{
            StorgeOfWords.countRounds = StorgeOfWords.words.count/2 + (StorgeOfWords.words.count % 2 == 0 ? 0 : 1 )
            while StorgeOfWords.usedThatWords.count < StorgeOfWords.countRounds {
                for index in StorgeOfWords.words.count/2..<StorgeOfWords.words.count{   //check
                    StorgeOfWords.usedThatWords.append(StorgeOfWords.words[index])
                }
            }
        }
    }
        
    class func giveMeNewWordForNewRound(completion: @escaping()->()){
        if countRounds==0{
            StorgeOfWords.wordPerGameRound=""
        }
        if StorgeOfWords.countRounds>0{
            countRounds-=1
        }
        StorgeOfWords.wordPerGameRound = StorgeOfWords.usedThatWords.popLast() ?? ""
        Translate.getTranslate(withWord: StorgeOfWords.wordPerGameRound) { (word) in
            StorgeOfWords.translate = word
            completion()
        }
    }
    
    class func randomWordsIncludingCurrentWord(completion:@escaping ()->()){
        var allWords:[String] = []
        var isThereThisWord = true
        while allWords.count < 2 {
            if StorgeOfWords.usedThatWords.count >= 2{
             for word in StorgeOfWords.usedThatWords{
                if allWords.index(of: word) != nil{
                    if isThereThisWord {
                        allWords.append(StorgeOfWords.wordPerGameRound)
                        isThereThisWord = false
                    }
                    continue
                }
                if StorgeOfWords.wordPerGameRound != word{
                    allWords.append(word)
                    if isThereThisWord {
                        allWords.append(StorgeOfWords.wordPerGameRound)
                        isThereThisWord = false
                    }
                    continue
                }
                if StorgeOfWords.usedThatWords.count<3{
                    allWords.append(word)
                    if isThereThisWord {
                        allWords.append(StorgeOfWords.wordPerGameRound)
                        isThereThisWord = false
                    }
                    continue
                }
              }
            }else{
                if lessonNumber==1{
                    allWords.append(StorgeOfWords.words[StorgeOfWords.words.count-allWords.count-1])
                }else{
                    allWords.append(StorgeOfWords.words[StorgeOfWords.words.count - StorgeOfWords.usedThatWords.count-allWords.count-1])
                }
            }
        }
        if isThereThisWord {
            allWords.append(StorgeOfWords.wordPerGameRound)
            isThereThisWord = false
        }
        
        for word in allWords{
            Translate.getTranslate(withWord: word){ (word) in
                StorgeOfWords.optionalTranslate.append(word)
                if StorgeOfWords.optionalTranslate.count == 3{
                    completion()
                }
            }
        }
    }

    
}

