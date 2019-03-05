//
//  OOPViewController.swift
//  AH Project Mock
//
//  Created by Jude Molloy on 05/02/2019.
//  Copyright © 2019 Jude Molloy. All rights reserved.
//

import UIKit

class OOPViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func homeButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "OOPToHome", sender: Any?.self)
    }
    
    // Initialises the variables required
    var OOPArray = [Any]()
    var questionArray = [Any]()
    var question: Any?
    let topic = "OOP"
    
    @IBOutlet weak var OOPInput: UITextField!
    
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
            destinationVC.topic = topic
            
        }
        else if segue.identifier == "OOPToMultipleChoice" {
            
            // Sets the destination view controller and then passes the data to the corresponding variable in that view controller
            let destinationVC = segue.destination as! MultipleChoiceViewController
            destinationVC.question = question as! MultipleChoiceQuestion
            destinationVC.questionArray = questionArray
            destinationVC.nextQuestionIndex = 1
            destinationVC.score = score
            destinationVC.topic = topic
            
        }
        
    }
    
    
    @IBAction func OOPInputEntered(_ sender: Any) {
        
        // Check to see if the input has been left empty, if so displays the error message.
        // If it is not blank then it will check which class has been entered in and will output the corresponding data.
        if (OOPInput.text?.isEmpty)! {
            let alertController = UIAlertController(title: "Error", message:
                "The text input cannot be left blank.", preferredStyle: UIAlertControllerStyle.alert)
            
            alertController.addAction(UIAlertAction(title: "Retry", style: UIAlertActionStyle.default,handler: nil))
            
            // Displays the alert
            self.present(alertController, animated: true, completion: nil)
        } else if OOPInput.text?.lowercased() == "monster" {
            print("it worked")
        }
        
        
        
    }
    
    
    @IBAction func startTestButtonPressed(_ sender: Any) {
        
        // Function to select random questions from the possible questions
        func getRandomQuestions(array: [Any]) -> [Any] {
            var questionsFrom = array
            
            // Loops through the array for 5 questions
            for _ in 1 ... 5 {
                // Chooses a random index to take a question from
                let index = Int.random(in: 0 ... (questionsFrom.count - 1))
                
                // Adds the question from the random index to the output array and removes it from the selection array
                questionArray.append(questionsFrom[index])
                questionsFrom.remove(at: index)
            }
            return questionArray
        }
        
        // Sets the question array to the result of the function call
        questionArray = getRandomQuestions(array: OOPArray)
        
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
