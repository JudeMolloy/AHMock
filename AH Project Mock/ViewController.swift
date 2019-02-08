//
//  ViewController.swift
//  AH Project Mock
//
//  Created by Jude Molloy on 05/11/2018.
//  Copyright © 2018 Jude Molloy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var questionArray: [Any] = []
    var recursionArray: [Any] = []
    var sortingAlgorithmsArray: [Any] = []
    var OOPArray: [Any] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Creating the questions to be added to the question arrays
        
        
        // Used as temporary file for creating the MC questions to go in the arrays
        var temp1 = MultipleChoiceQuestion(questionText: "Recusion is when a function calls...?", choiceA: "Your name", choiceB: "Itself", choiceC: "The police", choiceD: "Another function", correctChoice: "B", answerExplanation: "A recursive funtion is one that calls itself in its own execution.", relatedImage: nil)
        
        // Appends the new MC question to the recursion question array
        recursionArray.append(temp1)
        
        // Used as temporary file for creating the MC questions to go in the arrays
        temp1 = MultipleChoiceQuestion(questionText: "Recusion needs a _______ to allow it to stop and not run forever.", choiceA: "Base case", choiceB: "Stopping function", choiceC: "End case", choiceD: "Loop", correctChoice: "A", answerExplanation: "A recursive funtion requires a base case to stop it from going on forever and causing an execution error.", relatedImage: nil)
        
        // Appends the new MC question to the recursion question array
        recursionArray.append(temp1)
        
        // Used as temporary file for creating the MC questions to go in the arrays
        temp1 = MultipleChoiceQuestion(questionText: "What problem can occur if a recursive function does not have a base case?", choiceA: "Syntax error", choiceB: "Logic error", choiceC: "Stack overflow", choiceD: "Buffer overflow", correctChoice: "C", answerExplanation: "Everytime a the function is called recursively it gets added to the stack, so in the absense of a base case a stack overflow can occur.", relatedImage: nil)
        
        // Appends the new MC question to the recursion question array
        recursionArray.append(temp1)
        
        // Used as temporary file for creating the MC questions to go in the arrays
        temp1 = MultipleChoiceQuestion(questionText: "What is the worst-case time complexity of the Binary Search algorithm?", choiceA: "O(n log n)", choiceB: "O(1)", choiceC: "O(n)", choiceD: "O(log n)", correctChoice: "D", answerExplanation: "The Binary Search algorithm has a time complexity of O(log n) - which is in base 2 - as the search space is repeatedly split in half, hence the logarithmic time complexity.", relatedImage: nil)
        
        // Appends the new MC question to the recursion question array
        recursionArray.append(temp1)
        
        // Used as temporary file for creating the TR questions to go in the arrays
        var temp2 = TextResponseQuestion(questionText: "Which line in the code below is the base case for the recursive function? (Please enter the number of the line only.)", correctAnswer: "2", answerExplanation: "Line number 2 is the base case line as it is the condition that stops the recursive funtion from recursing forever.", relatedImage: UIImage(named: "Fibonacci Code"))
        
        // Appends the new TR question to the recursion question array
        recursionArray.append(temp2)
        
        // Used as temporary file for creating the MC questions to go in the arrays
        temp1 = MultipleChoiceQuestion(questionText: "What is the worst-case time complexity of the Linear Search algorithm?", choiceA: "O(log n)", choiceB: "O(1)", choiceC: "O(n)", choiceD: "O(n log n)", correctChoice: "C", answerExplanation: "The Linear Search algorithm has a time complexity of O(n). This is because in it's worst case it has to check every value in the list and only finds the search value in the last position.", relatedImage: nil)
        
        // Appends the new MC question to the recursion question array
        recursionArray.append(temp1)
        
        // Used as temporary file for creating the TR questions to go in the arrays
        temp2 = TextResponseQuestion(questionText: "Which line in the code is recursion used? (Please enter the number of the line only.)", correctAnswer: "4", answerExplanation: "Line number 4 is the recursive line as it is the condition that calls itself.", relatedImage: UIImage(named: "Fibonacci Code"))
        
        // Appends the new TR question to the recursion question array
        recursionArray.append(temp2)
        
        // Used as temporary file for creating the TR questions to go in the arrays
        temp2 = TextResponseQuestion(questionText: "Using the following code, determine the 4th Fibonacci number.", correctAnswer: "3", answerExplanation: "Working through the Fibonacci function the 4th number in the sequence is 3.", relatedImage: UIImage(named: "Fibonacci Code"))
        
        // Appends the new TR question to the recursion question array
        recursionArray.append(temp2)
        
        // Used as temporary file for creating the MC questions to go in the arrays
        temp1 = MultipleChoiceQuestion(questionText: "Every time a recursive funtion calls itself the function is added to the...", choiceA: "Call Queue", choiceB: "ALU", choiceC: "Call Stack", choiceD: "Call List", correctChoice: "C", answerExplanation: "The Call Stack keeps track of function calls. Whenever a function reaches a return statement, the function is popped off of the top of the Call Stack.", relatedImage: nil)
        
        // Appends the new MC question to the recursion question array
        recursionArray.append(temp1)
        
        // Used as temporary file for creating the TR questions to go in the arrays
        temp2 = TextResponseQuestion(questionText: "How many Binary Search function calls would be required to find the number 12?", correctAnswer: "1", answerExplanation: "The number 12 is in the middle position of the array. This is why only 1 call to the function is required as it will be found straight away. ", relatedImage: UIImage(named: "binarysearchlist"))
        
        // Appends the new TR question to the recursion question array
        recursionArray.append(temp2)
        
        // Used as temporary file for creating the TR questions to go in the arrays
        temp2 = TextResponseQuestion(questionText: "How many Binary Search function calls would be required to find the number 22?", correctAnswer: "2", answerExplanation: "The number 22 will require 2 function calls to find it.", relatedImage: UIImage(named: "binarysearchlist"))
        
        // Appends the new TR question to the recursion question array
        recursionArray.append(temp2)
        
        // Used as temporary file for creating the TR questions to go in the arrays
        temp2 = TextResponseQuestion(questionText: "How many Binary Search function calls would be required to find the number 3?", correctAnswer: "4", answerExplanation: "The number 3 will require 4 function calls which is the maximum number of calls required for a list of this size.", relatedImage: UIImage(named: "binarysearchlist"))
        
        // Appends the new TR question to the recursion question array
        recursionArray.append(temp2)
        
        // Used as temporary file for creating the MC questions to go in the arrays
        temp1 = MultipleChoiceQuestion(questionText: "A Binary Search algorithm requires the array to be...?", choiceA: "Unordered", choiceB: "Sorted", choiceC: "Small", choiceD: "Large", correctChoice: "B", answerExplanation: "A Binary Search algorithm requires that the array is sorted for it to work.", relatedImage: nil)
        
        // Appends the new MC question to the recursion question array
        recursionArray.append(temp1)
        
        // Used as temporary file for creating the MC questions to go in the arrays
        temp1 = MultipleChoiceQuestion(questionText: "The base case for a recursive Binary Search is?", choiceA: "min > max", choiceB: "max > min", choiceC: "min = 0", choiceD: "max == min", correctChoice: "A", answerExplanation: "The base case is if the min index is greater than the max index.", relatedImage: nil)
        
        // Appends the new MC question to the recursion question array
        recursionArray.append(temp1)
        
        // Used as temporary file for creating the MC questions to go in the arrays
        temp1 = MultipleChoiceQuestion(questionText: "The base case for a recursive Binary Search is?", choiceA: "min > max", choiceB: "max > min", choiceC: "min = 0", choiceD: "max == min", correctChoice: "A", answerExplanation: "The base case is if the min index is greater than the max index.", relatedImage: nil)
        
        // Appends the new MC question to the recursion question array
        recursionArray.append(temp1)
    }
    
    
    @IBAction func recursionButtonPressed(_ sender: Any) {
        
        // Segues to the Recursion screen.
        performSegue(withIdentifier: "HomeToRecursion", sender: nil)
        
    }
    
    @IBAction func OOPButtonPressed(_ sender: Any) {
        
        // Segues to the OOP screen.
        performSegue(withIdentifier: "HomeToOOP", sender: nil)
    }
    
    @IBAction func sortingAlgorithmsButtonPressed(_ sender: Any) {
        
        // Segues to the Sorting Algoritms screen.
        performSegue(withIdentifier: "HomeToSortingAlgorithms", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Checks to see which segue is going to be performed and passes the corresponding array to the upcoming view controller.
        if segue.identifier == "HomeToRecursion" {
            
            let destinationVC = segue.destination as! RecursionViewController
            destinationVC.recursionArray = recursionArray
            
        } else if segue.identifier == "HomeToSortingAlgorithms" {
            
            let destinationVC = segue.destination as! SortingAlgorithmsViewController
            destinationVC.sortingAlgorithmsArray = sortingAlgorithmsArray
            
        } else if segue.identifier == "HomeToOOP" {
            
            let destinationVC = segue.destination as! OOPViewController
            destinationVC.OOPArray = OOPArray
            
        }
        
    }
    
    
    // Function to select random questions from the possible questions
    func getMixedRandomQuestions(recursionArray: [Any], OOPArray: [Any], sortingAlgorithmsArray: [Any]) -> [Any] {
        
        getFiveQuestions(from: recursionArray)
        getFiveQuestions(from: OOPArray)
        getFiveQuestions(from: sortingAlgorithmsArray)
        
        return questionArray
    }
    
    func getFiveQuestions(from array: [Any]) -> [Any] {
        
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
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

