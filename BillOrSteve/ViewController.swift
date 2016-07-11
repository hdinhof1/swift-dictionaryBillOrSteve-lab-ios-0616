//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var facts = ["Steve Jobs" : [
                                    "He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
                                    "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
                                    "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.", "He was a pescetarian, meaning he ate no meat except for fish."
                                ],
                 
                 "Bill Gates":  [
                                    "He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.", "He scored 1590 (out of 1600) on his SATs.",
                                    "His foundation spends more on global health each year than the United Nation's World Health Organization.",
                                    "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
                                    "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."
                                    ]]
    var correctPerson = ""
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var factLabel: UILabel!
    
    @IBOutlet weak var steve: UIButton!
    @IBOutlet weak var bill: UIButton!
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        showFact()
    }
    
    func randomNumberFromZeroTo(number: Int) -> Int {
        return Int(arc4random_uniform(UInt32(number)))
    }
    
    func randomPerson() -> String {
        let randomNumber = arc4random_uniform(2)
        
        if randomNumber == 0 {
            return "Steve Jobs"
        } else {
            return "Bill Gates"
        }
    }
    func showFact() {
        if let randomFact = getRandomFact() {
            factLabel.text = randomFact.fact
            correctPerson = randomFact.person
        }
    }
    
    func getRandomFact() -> (person: String, fact: String)? {
        let person = randomPerson()
        if let availableFacts = facts[person] {
            let randomIndex = randomNumberFromZeroTo(availableFacts.count)
            return (person:person, fact:availableFacts[randomIndex])
        }else {
            print ("Error unknown key was entered")
            return nil;
        }
    }
    func correctGuess() {
        if let score = scoreLabel.text {
            if var factInt = Int(score){
                factInt += 1
                scoreLabel.text = String(factInt)
            }
        }
    }
    @IBAction func steveTapped(sender: AnyObject) {
        if ("Steve Jobs" == correctPerson) {
            correctGuess()
        }
        else {
            print("Wrong guess: Bill! Try again!")
        }
        
        showFact()
    }
    
    @IBAction func billTapped(sender: AnyObject) {
        if ("Bill Gates" == correctPerson) {
            correctGuess()
        }
        else {
            print("Wrong guess: Bill! Try again!")
        }
        
        showFact()
    }
}
