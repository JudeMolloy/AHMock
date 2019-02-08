//
//  RecursionViewController.swift
//  AH Project Mock
//
//  Created by Jude Molloy on 07/12/2018.
//  Copyright © 2018 Jude Molloy. All rights reserved.
//

import UIKit

class RecursionViewController: UIViewController {

    // Create and error alert to display validation message
    let errorAlertController = UIAlertController(title: "Error", message:
        "The text input cannot be left blank.", preferredStyle: UIAlertControllerStyle.alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add action to the error alert controller for empty field.
        errorAlertController.addAction(UIAlertAction(title: "Retry", style: UIAlertActionStyle.default,handler: nil))
        // Do any additional setup after loading the view.
    }
    
    
    // Initialises the variables required
    var recursionArray = [Any]()
    var questionArray = [Any]()
    var question: Any?
    var inputArray = [2, 3, 5, 8, 9, 12, 15, 18, 22, 25, 28]
    var functionCalls = 0
    var foundBinarySearch = "The value was not found in the list."

    
    @IBAction func homeButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "RecursionToHome", sender: Any?.self)
    }
    
    // Creates links to the UI elements
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var fibonacciInput: UITextField!
    
    @IBOutlet weak var binarySearchFoundLabel: UILabel!
    @IBOutlet weak var functionCallsLabel: UILabel!
    @IBOutlet weak var binarySearchInput: UITextField!
    
    @IBAction func inputBinarySearch(_ sender: Any) {
        functionCalls = 0
        if (binarySearchInput.text?.isEmpty)! {
            
            // Display the alert that has just been created
            self.present(errorAlertController, animated: true, completion: nil)
        } else {
            
            // Calls the recursive binary search function with the input data.
            recursiveBinarySearch(array: inputArray, searchValue: Int(binarySearchInput.text!)!, min: 0, max: 10)
            
            // Updates the UI elements to display the data from the binary search call.
            binarySearchFoundLabel.text = foundBinarySearch
            functionCallsLabel.text = "Number of Function Calls: " + String(functionCalls)
            
        }
    }
    
    // Function that is called when the user enters their input into the interactive fibonacci sequence number finder.
    @IBAction func inputFibonacci(_ sender: Any) {
        
        // Checks to see if the input is empty
        if (fibonacciInput.text?.isEmpty)! {
            
            // Display the alert that has just been created
            self.present(errorAlertController, animated: true, completion: nil)
        }
        // Check to see that the number that was inputted was in the valid range. Anything more than 25 is excessive on the phone memory.
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
    
    // Simple recursive fibonacci function
    func fibonacci(number: Int) -> Int {
        
        if number <= 2 {
            return 1
        }
        else {
            return fibonacci(number: number - 1) + fibonacci(number: number - 2)
        }
    }
    
    // Recursive Binary Search algorithm.
    func recursiveBinarySearch(array: [Int], searchValue: Int, min: Int, max: Int) -> Int {
        functionCalls += 1
        // Calculate the middle index.
        let mid = Int((min + max) / 2)
        
        // Checks to see if the whole array has been searched.
        if min > max {
            foundBinarySearch = "The value was not found in the list."
            return -1
        } else if array[mid] == searchValue {
            // Returns the number if the value is found.
            foundBinarySearch = "The value was found in the list at index " + String(mid) + "."
            return mid
        } else if array[mid] > searchValue {
            // Searches the lower half of the array if the search value is less than the mid value.
            return recursiveBinarySearch(array: array, searchValue: searchValue, min: min, max: mid - 1)
        } else {
            // Searches the upper half of the array if the search value is greater than the mid value.
            return recursiveBinarySearch(array: array, searchValue: searchValue, min: mid + 1, max: max)
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Initialise the score variable and set it equal to 0
        var score = 0
        
        // If statement to decide which segue to prepare for
        if segue.identifier == "RecursionToTextResponse" {
            
            // Sets the destination view controller and then passes the data to the corresponding variable in that view controller
            let destinationVC = segue.destination as! TextResponseViewController
            destinationVC.question = question as! TextResponseQuestion
            destinationVC.questionArray = questionArray
            destinationVC.nextQuestionIndex = 1
            destinationVC.score = score

        }
        else if segue.identifier == "RecursionToMultipleChoice" {
            
            // Sets the destination view controller and then passes the data to the corresponding variable in that view controller
            let destinationVC = segue.destination as! MultipleChoiceViewController
            destinationVC.question = question as! MultipleChoiceQuestion
            destinationVC.questionArray = questionArray
            destinationVC.nextQuestionIndex = 1
            destinationVC.score = score
            
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
        questionArray = getRandomQuestions(array: recursionArray)
        
        // Selects the first question
        question = questionArray[0]
        
        
        // Checks to see the type of the first question and then segues to the appropriate view controller.
        if question is MultipleChoiceQuestion {
            
            // Performs the segue
            performSegue(withIdentifier: "RecursionToMultipleChoice", sender: nil)
        
        }
        else if question is TextResponseQuestion {
            
            // Peforms the segue
            performSegue(withIdentifier: "RecursionToTextResponse", sender: nil)
            
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
