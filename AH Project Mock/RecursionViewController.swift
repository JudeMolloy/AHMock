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

    var recursionArray: Array<Any>?
    
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
        
        
        // Create a variable that you want to send
        let question = recursionArray![0]
        
        if question is MultipleChoiceQuestion {
            let destinationVC = segue.destination as! MultipleChoiceViewController
            destinationVC.question = question as! MultipleChoiceQuestion
        }
        else if question is TextResponseQuestion {
            let destinationVC = segue.destination as! TextResponseViewController
            destinationVC.question = question as! TextResponseQuestion
        }
        
        
    }
    
    
    @IBAction func startTestButtonPressed(_ sender: Any) {
        
        let question = recursionArray![0]
        
        if question is MultipleChoiceQuestion {
            performSegue(withIdentifier: "RecursionToMultipleChoice", sender: nil)
        
        }
        else if question is TextResponseQuestion {
          
            
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
