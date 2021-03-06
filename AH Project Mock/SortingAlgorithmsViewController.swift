//
//  SortingAlgorithmsViewController.swift
//  AH Project
//
//  Copyright © 2019 Jude Molloy. All rights reserved.
//

import UIKit

class SortingAlgorithmsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Function that is called when home button is pressed.
    @IBAction func homeButtonPressed(_ sender: Any) {
        
        // Changes to home screen
        performSegue(withIdentifier: "SortingAlgorithmsToHome", sender: Any?.self)
    }
    
    // Initialises the variables required
    var sortingAlgorithmsArray = [Any]()
    var questionArray = [Any]()
    var question: Any?
    var swapped: Bool = true
    let topic = "Sorting Algorithms"

    @IBOutlet weak var outputArrayLabel: UILabel!
    
    // Function that is called when the bubble sort button is pressed.
    @IBAction func bubbleSortButtonPressed(_ sender: Any) {
        
        // Creates the input array.
        var inputArray = [5, 19, 3, 6, 12, 1, 16, 2, 10, 18]
        
        // Sets the variable to the output of the bubble sort function call on the input array.
        var outputArray = bubbleSort(inputArray: &inputArray)
        
        outputArrayLabel.text = "["
        
        // Formats the output so it displays nicely in the UI.
        // Bit of a brute force method, however, it is sutiable for its basic purpose
        for number in outputArray {
            if number == 19 {
                self.outputArrayLabel.text = outputArrayLabel.text! + (String(number) + "]")
            } else {
                self.outputArrayLabel.text = outputArrayLabel.text! + (String(number) + ", ")
            }
        }
        
        
        
    }
    
    // Bubble Sort Algorithm
    func bubbleSort(inputArray: inout [Int]) -> [Int] {
        
        //Set the swapped variable to true
        swapped = true
        
        // Continues to loop through the array while it is unsorted
        while swapped == true {
            
            // Sets the swapped variable to false
            swapped = false
            
            // Loops through the array
            for i in 1 ... (inputArray.count - 1) {
                // If the element to the left is greater than the one on the right swapped is set to true and a swap takes place.
                if inputArray[i] < inputArray[i - 1] {
                    swapped = true
                    let temp = inputArray[i]
                    inputArray[i] = inputArray[i - 1]
                    inputArray[i - 1] = temp
                }
            }
        }
        // Returns the now sorted array.
        return inputArray
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Initialise the score variable and set it equal to 0
        var score = 0
        
        // If statement to decide which segue to prepare for
        if segue.identifier == "SortingAlgorithmsToTextResponse" {
            
            // Sets the destination view controller and then passes the data to the corresponding variable in that view controller
            let destinationVC = segue.destination as! TextResponseViewController
            destinationVC.question = question as! TextResponseQuestion
            destinationVC.questionArray = questionArray
            destinationVC.nextQuestionIndex = 1
            destinationVC.score = score
            destinationVC.topic = topic
            
        }
        else if segue.identifier == "SortingAlgorithmsToMultipleChoice" {
            
            // Sets the destination view controller and then passes the data to the corresponding variable in that view controller
            let destinationVC = segue.destination as! MultipleChoiceViewController
            destinationVC.question = question as! MultipleChoiceQuestion
            destinationVC.questionArray = questionArray
            destinationVC.nextQuestionIndex = 1
            destinationVC.score = score
            destinationVC.topic = topic
            
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
        questionArray = getRandomQuestions(array: sortingAlgorithmsArray)
        
        // Selects the first question
        question = questionArray[0]
        
        
        // Checks to see the type of the first question and then segues to the appropriate view controller.
        if question is MultipleChoiceQuestion {
            
            // Performs the segue
            performSegue(withIdentifier: "SortingAlgorithmsToMultipleChoice", sender: nil)
            
        }
        else if question is TextResponseQuestion {
            
            // Peforms the segue
            performSegue(withIdentifier: "SortingAlgorithmsToTextResponse", sender: nil)
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
