//
//  RandomTestViewController.swift
//  AH Project
//
//  Copyright © 2019 Jude Molloy. All rights reserved.
//

import UIKit

class RandomTestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Function that is called when home button is pressed.
    @IBAction func homeButtonPressed(_ sender: Any) {
        
        // Changes to home screen
        performSegue(withIdentifier: "OOPToHome", sender: Any?.self)
    }
    
    // Initialises the variables required
    var OOPArray = [Any]()
    var questionArray = [Any]()
    var question: Any?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Initialise the score variable and set it equal to 0
        var score = 0
        
        // If statement to decide which segue to prepare for
        if segue.identifier == "OOPToTextResponse" {
            
            // Sets the destination view controller and then passes the data to the corresponding variable in that view controller
            let destinationVC = segue.destination as! TextResponseViewController
            destinationVC.question = question as! TextResponseQuestion
            destinationVC.questionArray = questionArray
            destinationVC.nextQuestionIndex = 1
            destinationVC.score = score
            
        }
        else if segue.identifier == "OOPToMultipleChoice" {
            
            // Sets the destination view controller and then passes the data to the corresponding variable in that view controller
            let destinationVC = segue.destination as! MultipleChoiceViewController
            destinationVC.question = question as! MultipleChoiceQuestion
            destinationVC.questionArray = questionArray
            destinationVC.nextQuestionIndex = 1
            destinationVC.score = score
            
        }
        
    }
    
    // Called when the start test button is pressed
    @IBAction func startTestButtonPressed(_ sender: Any) {
        
        // Function to select random questions from the possible questions
        func getMixedRandomQuestions(array: [Any]) -> [Any] {
                        return questionArray
        }
        
        func getFiveQuestions(from array: [Any]) {
            
            var questionsFrom = array
            
            // Loops through the array for 5 questions
            for _ in 1 ... 5 {
                // Chooses a random index to take a question from
                let index = Int.random(in: 0 ... (questionsFrom.count - 1))
                
                // Adds the question from the random index to the output array and removes it from the selection array
                questionArray.append(questionsFrom[index])
                questionsFrom.remove(at: index)
            }

        }
        
        // Sets the question array to the r esult of the function call
        
        
        // Selects the first question
        question = questionArray[0]
        
        
        // Checks to see the type of the first question and then segues to the appropriate view controller.
        if question is MultipleChoiceQuestion {
            
            // Performs the segue
            performSegue(withIdentifier: "OOPToMultipleChoice", sender: nil)
            
        }
        else if question is TextResponseQuestion {
            
            // Peforms the segue
            performSegue(withIdentifier: "OOPToTextResponse", sender: nil)
            
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
