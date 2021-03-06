//
//  OOPViewController.swift
//  AH Project
//
//  Copyright © 2019 Jude Molloy. All rights reserved.
//

import UIKit

class OOPViewController: UIViewController {

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
    let topic = "OOP"
    
    @IBOutlet weak var OOPInput: UITextField!
    @IBOutlet weak var superClassLabel: UILabel!
    @IBOutlet weak var subClassLabel: UILabel!
    
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
        
        // Closes the keyboard when a user enters the input.
        OOPInput.resignFirstResponder()
        
        // Check to see if the input has been left empty, if so displays the error message.
        // If it is not blank then it will check which class has been entered in and will output the corresponding data.
        if (OOPInput.text?.isEmpty)! {
            
            // Creates error alert
            let alertController = UIAlertController(title: "Error", message:
                "The text input cannot be left blank.", preferredStyle: UIAlertControllerStyle.alert)
            
            alertController.addAction(UIAlertAction(title: "Retry", style: UIAlertActionStyle.default,handler: nil))
            
            // Displays the alert
            self.present(alertController, animated: true, completion: nil)
        } else if OOPInput.text?.lowercased() == "character" {
            
            // Changes the data that is outputted to the screen.
            superClassLabel.text = "Super-classes: None"
            subClassLabel.text = "Sub-classes: All other classes"
            
        } else if (OOPInput.text?.count)! > 25 {
            
            // Create the length check error alert controller.
            let alertController = UIAlertController(title: "Error", message:
                "Please enter less than 25 characters.", preferredStyle: UIAlertControllerStyle.alert)
            
            alertController.addAction(UIAlertAction(title: "Retry", style: UIAlertActionStyle.default,handler: nil))
            
            // Displays the alert
            self.present(alertController, animated: true, completion: nil)
            
            // Clears the input box.
            OOPInput.text = ""
        }
        else if OOPInput.text?.lowercased() == "monster" {
            
            // Changes the data that is outputted to the screen.
            superClassLabel.text = "Super-classes: Character"
            subClassLabel.text = "Sub-classes: Dragon & Orc"
            
        } else if OOPInput.text?.lowercased() == "hero" {
            
            // Changes the data that is outputted to the screen.
            superClassLabel.text = "Super-classes: Character"
            subClassLabel.text = "Sub-classes: None"
            
        } else if OOPInput.text?.lowercased() == "dragon" {
            
            // Changes the data that is outputted to the screen.
            superClassLabel.text = "Super-classes: Monster & Character"
            subClassLabel.text = "Sub-classes: None"
            
        } else if OOPInput.text?.lowercased() == "orc" {
            
            // Changes the data that is outputted to the screen.
            superClassLabel.text = "Super-classes: Monster & Character"
            subClassLabel.text = "Sub-classes: None"
            
        } else {
            
            // Creates error alert
            let alertController = UIAlertController(title: "Error", message:
                "Please enter the name of one of the classes in the above image.", preferredStyle: UIAlertControllerStyle.alert)
            
            alertController.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default,handler: nil))
            
            // Displays the alert
            self.present(alertController, animated: true, completion: nil)
        
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
    }
    
}
