//
//  RecursionViewController.swift
//  AH Project Mock
//
//  Created by Jude Molloy on 07/12/2018.
//  Copyright © 2018 Jude Molloy. All rights reserved.
//

import UIKit

class RecursionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    }

    var recursionArray = [Any]()
    
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var fibonacciInput: UITextField!
    
    // Function that is called when the user enters their input into the interactive fibonacci sequence number finder.
    @IBAction func inputFibonacci(_ sender: Any) {
        
        // Checks to see if the input is empty
        if (fibonacciInput.text?.isEmpty)! {
            
            // Create alert to display validation message
            let alertController = UIAlertController(title: "Error", message:
                "The text input cannot be left blank.", preferredStyle: UIAlertControllerStyle.alert)
            
            alertController.addAction(UIAlertAction(title: "Retry", style: UIAlertActionStyle.default,handler: nil))
            
            // Display the alert that has just been created
            self.present(alertController, animated: true, completion: nil)
        }
        // Check to see that the number that was inputted was in the valid range.
        else if Int((fibonacciInput.text)!)! < 1 || Int((fibonacciInput.text)!)! > 25 {
            
            
            // Create alert to display validation message
            let alertController = UIAlertController(title: "Error", message:
                "Please enter a number between 1 and 25.", preferredStyle: UIAlertControllerStyle.alert)
            
            alertController.addAction(UIAlertAction(title: "Retry", style: UIAlertActionStyle.default,handler: nil))
            
            // Display the alert that has just been created
            self.present(alertController, animated: true, completion: nil)
            
            
        }
        else {
            // Create constant to store the value that has been validated.
            let number = Int(fibonacciInput.text!)!
            
            // Output the result of the recursively found result to the screen
            if let result = fibonacci(number: number) as? Int {
                answerLabel.text = "Answer: " + String(result)
            }
        }
        
        
        
    }
    
    func fibonacci(number: Int) -> Int {
        
        if number <= 2 {
            return 1
        }
        else {
            return fibonacci(number: number - 1) + fibonacci(number: number - 2)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        func getRandomQuestions(array: [Any]) -> [Any] {
            var questionArray = [Any]()
            var questionsFrom = array
            
            for _ in 1 ... 5 {
                let index = Int.random(in: 0 ... (questionsFrom.count - 1))
                print(index)
                questionArray.append(questionsFrom[index])
                questionsFrom.remove(at: index)
            }
            return questionArray
        }
        
        var questionArray = getRandomQuestions(array: recursionArray)
        
        print(segue)
        
        let question = questionArray[0]
        
        if segue.identifier == "RecursionToTextResponse" {
            
            // Sets the destination view controller and then passes the data to the corresponding variable in that view controller
            let destinationVC = segue.destination as! TextResponseViewController
            destinationVC.question = question as! TextResponseQuestion
            destinationVC.questionArray = questionArray
            destinationVC.nextQuestionIndex = 1

        }
        else if segue.identifier == "RecursionToMultipleChoice" {
            
            // Sets the destination view controller and then passes the data to the corresponding variable in that view controller
            let destinationVC = segue.destination as! MultipleChoiceViewController
            destinationVC.question = question as! MultipleChoiceQuestion
            destinationVC.questionArray = questionArray
            destinationVC.nextQuestionIndex = 1
            
        }
        
        
    }
    
    
    @IBAction func startTestButtonPressed(_ sender: Any) {
        
        // Creates a constant to store the first question in questions array.
        let question = recursionArray[0]
        
        
        // Checks to see the type of the first question and then segues to the appropriate view controller.
        if question is MultipleChoiceQuestion {
            
            print("About to perform TR segue")
            // Performs the segue
            performSegue(withIdentifier: "RecursionToMultipleChoice", sender: nil)
        
        }
        else if question is TextResponseQuestion {
            
            print("About to perform TR segue")
            // Peforms the segue
            performSegue(withIdentifier: "RecursionToTextResponse", sender: nil)
            
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
