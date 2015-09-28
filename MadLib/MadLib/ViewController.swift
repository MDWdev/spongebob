//
//  ViewController.swift
//  MadLib
//
//  Created by Robbo on 2015. 9. 28..
//  Copyright © 2015년 ieatkimchi. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet var entryType: UILabel!
    @IBOutlet var userInput: UITextField!
    @IBOutlet var storyText: UITextView!
    
    var wordStack = [String]()
    var wordToInput = 0
    var wordsUsedCount = 0
    var newStory = [String]()
    let speechSynthesizer = AVSpeechSynthesizer()
    
//    var wordsNeeded = ["Fruit","Noun","Name","Adj.","Color","Adj.","Adj.","Noun","Verb","Verb","Noun","Verb","Animal"]
        var wordsNeeded = ["Fruit","Noun","Fruit"]
 

//    var storyLines = ["Ohhhhh... who lives in a"," under the.......?,"," Squarepants! "," and "," and "," Smelly is he! "," Squarepants! "," Then "," on the "," and "," like a "," ."," Squarepants! \n Ready? "," Squarepants! "," Squarepants! "," Squarepants! "," ... Squarepants! ahhhahhhahahhaha! "]
    
    var storyLines = ["Ohhhhh... who lives in a"," under the .......?,"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.greenColor()
        setWordType()
        
    }
    
    func setWordType() {
        entryType.text = "\(wordsNeeded[wordsUsedCount])"
        
    }
    
    func updateWordType() {
        setWordType()
        print(wordsUsedCount,wordStack)
        
    }
    
    override func motionEnded(_motion: UIEventSubtype,
        withEvent event: UIEvent?) {
            if _motion == .MotionShake {
                wordStack.append(userInput.text!)
                userInput.text! = " "
                
                if(wordStack.count == wordsNeeded.count) {
                    storyText.text = "All set here we go!"
                    printOutput()
//                    resetGame()
                    
                } else {
                    wordsUsedCount++
                    updateWordType()
                }
            }
            
    }
    
    func printOutput() {
        for eachLine in storyLines {
            newStory.append(eachLine + "\(wordStack[wordToInput])")
            print(newStory.append(eachLine + "\(wordStack[wordToInput])"))
        }
        print(wordToInput)
        wordToInput++
        storyText.text = newStory.joinWithSeparator(" ")
        
//        let speechUtterance = AVSpeechUtterance(string: storyText.text)
//        
//        speechSynthesizer.speakUtterance(speechUtterance)
        
    }
    
//    func resetGame() {
//        wordStack = 0
//    }


}