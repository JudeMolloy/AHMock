//
//  TextResponseViewController.swift
//  AH Project Mock
//
//  Created by Jude Molloy on 30/11/2018.
//  Copyright © 2018 Jude Molloy. All rights reserved.
//

import UIKit

class TextResponseViewController: UIViewController {
    
    var question: TextResponseQuestion?
    var questionArray = [Any]()
    var nextQuestionIndex: Int?
    
    // Links to UI elements
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var relatedImage: UIImageView!
    @IBOutlet weak var textResponseInput: UITextField!
    
    var incorrectAlertController: UIAlertController?
    
    
    @IBAction func textResponseInputEntered(_ sender: Any) {
        
        // Check to see if the input has been left empty, if so display an error message.
        if (textResponseInput.text?.isEmpty)! {
            let alertController = UIAlertController(title: "Error", message:
                "The text input cannot be left blank.", preferredStyle: UIAlertControllerStyle.alert)
            
            alertController.addAction(UIAlertAction(title: "Retry", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        }
        else {
            
            if textResponseInput.text == question?.correctAnswer {
                    
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
            
        }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionText.text = question?.questionText
        
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

        // Do any additional setup after loading the view.
    }
    
    
    func nextQuestion() {
        // Checks to see the type of the next question and then segues to the appropriate view controller.
        if questionArray.count > nextQuestionIndex! {
            var nextQuestion = questionArray[nextQuestionIndex!]
        
        
            if nextQuestion is TextResponseQuestion {
            
                question = questionArray[nextQuestionIndex!] as! TextResponseQuestion
            
                // Sets all of the on screen elements to the data that was passed to this view controller
                questionText.text = question?.questionText
                
                // Checks to see if the image needs to be set
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
            else if nextQuestion is MultipleChoiceQuestion {
            
                // Peforms the segue
                performSegue(withIdentifier: "TextResponseToMultipleChoice", sender: nil)
            
            }
            // Increments the variable by 1
            nextQuestionIndex = nextQuestionIndex! + 1
        } else {
            
            
            // Display the results of the short test.
            
            
        }
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var nextQuestion = questionArray[nextQuestionIndex!]
        
        if nextQuestion is MultipleChoiceQuestion {
            
            // Sets the destination view controller and then passes the data to the corresponding variable in that view controller
            let destinationVC = segue.destination as! MultipleChoiceViewController
            destinationVC.question = nextQuestion as! MultipleChoiceQuestion
            destinationVC.questionArray = questionArray
            destinationVC.nextQuestionIndex = nextQuestionIndex! + 1
            
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













