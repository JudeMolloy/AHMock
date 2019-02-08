//
//  MutltipleChoiceViewController.swift
//  AH Project Mock
//
//  Created by Jude Molloy on 30/11/2018.
//  Copyright © 2018 Jude Molloy. All rights reserved.
//

import UIKit

class MultipleChoiceViewController: UIViewController {
    
    // Create the variable to store the data passed from previous view controller
    var questionArray = [Any]()
    var nextQuestionIndex: Int?
    
    var question: MultipleChoiceQuestion?
    var score: Int?
    
    @IBAction func homeButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "MultipleChoiceToHome", sender: nil)
    }
    
    // Links to the UI features of on screen elements
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var relatedImage: UIImageView!
    
    
    @IBOutlet weak var choiceAbutton: RoundedButton!
    @IBOutlet weak var choiceBbutton: RoundedButton!
    @IBOutlet weak var choiceCbutton: RoundedButton!
    @IBOutlet weak var choiceDbutton: RoundedButton!
    
    var incorrectAlertController: UIAlertController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call the function to set all of the question data to the UI elements
        setScreenData(question: question)
        
        // Do any additional setup after loading the view.
    }
    
    func setScreenData(question: MultipleChoiceQuestion?) {
        // Sets all of the on screen elements to the data that was passed to this view controller
        questionText.text = question?.questionText
        choiceAbutton.setTitle(question?.choiceA, for: .normal)
        choiceBbutton.setTitle(question?.choiceB, for: .normal)
        choiceCbutton.setTitle(question?.choiceC, for: .normal)
        choiceDbutton.setTitle(question?.choiceD, for: .normal)
        
        if question?.relatedImage != nil {
            relatedImage.image = question?.relatedImage
        }
        
        // Creates the incorrect message alert
        incorrectAlertController = UIAlertController(title: "Incorrect!", message:
            question?.answerExplanation, preferredStyle: UIAlertControllerStyle.alert)
        
        incorrectAlertController!.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default,handler: { action in
            // Calls the function to load the nex question
            self.nextQuestion()
        }))
    }
    
    
    @IBAction func choiceAbuttonPressed(_ sender: Any) {
        // Call the function to check if the correct answer was selected.
        checkCorrect(selected: "A")
    }

    @IBAction func choiceBbuttonPressed(_ sender: Any) {
        // Call the function to check if the correct answer was selected.
        checkCorrect(selected: "B")
    }
    
    @IBAction func choiceCbuttonPressed(_ sender: Any) {
        // Call the function to check if the correct answer was selected.
        checkCorrect(selected: "C")
    }
    
    @IBAction func choiceDbuttonPressed(_ sender: Any) {
        // Call the function to check if the correct answer was selected.
        checkCorrect(selected: "D")
    }
    
    func checkCorrect(selected: String) {
        // Checks if this choice is the correct answer
        if question?.correctChoice == selected {
            
            // Increments the score variable by one
            score = score! + 1
            
            // Creates an alert message to display to the user.
            let alertController = UIAlertController(title: "Correct!", message:
                "Well Done! That is the correct answer.", preferredStyle: UIAlertControllerStyle.alert)
            
            alertController.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default,handler: { action in
                // Calls the function to load the nex question
                self.nextQuestion()
            }))
            
            // Displays the alert.
            self.present(alertController, animated: true, completion: nil)
        
        }
        else {
            self.present(incorrectAlertController as! UIViewController, animated: true, completion: nil)
            
        }
    }
    
    func nextQuestion() {
        // Checks to see the type of the next question and then segues to the appropriate view controller.
        if questionArray.count > nextQuestionIndex! {
            var nextQuestion = questionArray[nextQuestionIndex!]
            
            
            if nextQuestion is MultipleChoiceQuestion {
                
                question = questionArray[nextQuestionIndex!] as! MultipleChoiceQuestion
                
                setScreenData(question: question)
            }
            else if nextQuestion is TextResponseQuestion {
                
                // Peforms the segue
                performSegue(withIdentifier: "MultipleChoiceToTextResponse", sender: nil)
                
            }
            
            nextQuestionIndex = nextQuestionIndex! + 1
        } else {
            
            // Creates the final message to be displayed in the output alert
            let finalMessage = "You answered " + String(score!) + " out of " + String(questionArray.count) + " correctly."
            
            // Creates the variable for the alert controller
            var FinalScoreAlertController: UIAlertController?
            
            // Calculates the percentage of questions answered correctly which will determine the headline that will be outputted.
            let percentage = (Double(score!)/Double((questionArray.count)) * 100)
            
            // If statements to set the correct alert header for the score achieved by the user
            if percentage < 30.0 {
                FinalScoreAlertController = UIAlertController(title: "Try Harder!", message:
                    finalMessage, preferredStyle: UIAlertControllerStyle.alert)
            }
            else if percentage < 70.0 && percentage > 30.0 {
                FinalScoreAlertController = UIAlertController(title: "Good!", message:
                    finalMessage, preferredStyle: UIAlertControllerStyle.alert)
            }
            else {
                FinalScoreAlertController = UIAlertController(title: "Well Done!", message:
                    finalMessage, preferredStyle: UIAlertControllerStyle.alert)
            }
            
            // Adds an action to the alert controller to allow the user to return home after the test
            FinalScoreAlertController!.addAction(UIAlertAction(title: "Return Home", style: UIAlertActionStyle.default,handler: { action in
                
                // Return Home
                
                // Peforms the segue
                self.performSegue(withIdentifier: "MultipleChoiceToHome", sender: nil)
                
            }))

            // Shows the alert
            self.present(FinalScoreAlertController!, animated: true, completion: nil)
            
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if questionArray.count > nextQuestionIndex! {
            
            // Sets the value of the next question
            var nextQuestion = questionArray[nextQuestionIndex!]
            
            // Checks the type of the next question and acts accordingly
            if segue.identifier == "MultipleChoiceToTextResponse" {
                
                // Sets the destination view controller and then passes the data to the corresponding variable in that view controller
                let destinationVC = segue.destination as! TextResponseViewController
                destinationVC.question = nextQuestion as! TextResponseQuestion
                destinationVC.questionArray = questionArray
                destinationVC.nextQuestionIndex = nextQuestionIndex! + 1
                destinationVC.score = score
                
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
