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
    var question: Any?
    var score = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Creating the questions to be added to the question arrays
        
        
        // Used as temporary file for creating the MC questions to go in the arrays
        var temp1 = MultipleChoiceQuestion(questionText: "Recusion is when a function calls...?", choiceA: "Your name", choiceB: "Itself", choiceC: "The police", choiceD: "Another function", correctChoice: "B", answerExplanation: "A recursive funtion is one that calls itself in its own execution.", relatedImage: UIImage(named: "question"))
        
        // Appends the new MC question to the recursion question array
        recursionArray.append(temp1)
        
        // Used as temporary file for creating the MC questions to go in the arrays
        temp1 = MultipleChoiceQuestion(questionText: "Recusion needs a _______ to allow it to stop and not run forever.", choiceA: "Base case", choiceB: "Stopping function", choiceC: "End case", choiceD: "Loop", correctChoice: "A", answerExplanation: "A recursive funtion requires a base case to stop it from going on forever and causing an execution error.", relatedImage: UIImage(named: "question"))
        
        // Appends the new MC question to the recursion question array
        recursionArray.append(temp1)
        
        // Used as temporary file for creating the MC questions to go in the arrays
        temp1 = MultipleChoiceQuestion(questionText: "What problem can occur if a recursive function does not have a base case?", choiceA: "Syntax error", choiceB: "Logic error", choiceC: "Stack overflow", choiceD: "Buffer overflow", correctChoice: "C", answerExplanation: "Everytime a the function is called recursively it gets added to the stack, so in the absense of a base case a stack overflow can occur.", relatedImage: UIImage(named: "question"))
        
        // Appends the new MC question to the recursion question array
        recursionArray.append(temp1)
        
        // Used as temporary file for creating the MC questions to go in the arrays
        temp1 = MultipleChoiceQuestion(questionText: "What is the worst-case time complexity of the Binary Search algorithm?", choiceA: "O(n log n)", choiceB: "O(1)", choiceC: "O(n)", choiceD: "O(log n)", correctChoice: "D", answerExplanation: "The Binary Search algorithm has a time complexity of O(log n) - which is in base 2 - as the search space is repeatedly split in half, hence the logarithmic time complexity.", relatedImage: UIImage(named: "question"))
        
        // Appends the new MC question to the recursion question array
        recursionArray.append(temp1)
        
        // Used as temporary file for creating the TR questions to go in the arrays
        var temp2 = TextResponseQuestion(questionText: "Which line in the code below is the base case for the recursive function? (Please enter the number of the line only.)", correctAnswer: "2", answerExplanation: "Line number 2 is the base case line as it is the condition that stops the recursive funtion from recursing forever.", relatedImage: UIImage(named: "Fibonacci Code"))
        
        // Appends the new TR question to the recursion question array
        recursionArray.append(temp2)
        
        // Used as temporary file for creating the MC questions to go in the arrays
        temp1 = MultipleChoiceQuestion(questionText: "What is the worst-case time complexity of the Linear Search algorithm?", choiceA: "O(log n)", choiceB: "O(1)", choiceC: "O(n)", choiceD: "O(n log n)", correctChoice: "C", answerExplanation: "The Linear Search algorithm has a time complexity of O(n). This is because in it's worst case it has to check every value in the list and only finds the search value in the last position.", relatedImage: UIImage(named: "question"))
        
        // Appends the new MC question to the recursion question array
        recursionArray.append(temp1)
        
        // Used as temporary file for creating the TR questions to go in the arrays
        temp2 = TextResponseQuestion(questionText: "Which line in the code is recursion used? (Please enter the number of the line only.)", correctAnswer: "4", answerExplanation: "Line number 4 is the recursive line as it is the condition that calls itself.", relatedImage: UIImage(named: "Fibonacci Code"))
        
        // Appends the new TR question to the recursion question array
        recursionArray.append(temp2)
        
        // Used as temporary file for creating the TR questions to go in the arrays
        temp2 = TextResponseQuestion(questionText: "Using the following code, determine the 4th Fibonacci number. (Please enter an integer only.)", correctAnswer: "3", answerExplanation: "Working through the Fibonacci function the 4th number in the sequence is 3.", relatedImage: UIImage(named: "Fibonacci Code"))
        
        // Appends the new TR question to the recursion question array
        recursionArray.append(temp2)
        
        // Used as temporary file for creating the MC questions to go in the arrays
        temp1 = MultipleChoiceQuestion(questionText: "Every time a recursive funtion calls itself the function is added to the...", choiceA: "Call Queue", choiceB: "ALU", choiceC: "Call Stack", choiceD: "Call List", correctChoice: "C", answerExplanation: "The Call Stack keeps track of function calls. Whenever a function reaches a return statement, the function is popped off of the top of the Call Stack.", relatedImage: UIImage(named: "question"))
        
        // Appends the new MC question to the recursion question array
        recursionArray.append(temp1)
        
        // Used as temporary file for creating the TR questions to go in the arrays
        temp2 = TextResponseQuestion(questionText: "How many Binary Search function calls would be required to find the number 12? (Please enter an integer only.)", correctAnswer: "1", answerExplanation: "The number 12 is in the middle position of the array. This is why only 1 call to the function is required as it will be found straight away. ", relatedImage: UIImage(named: "binarysearchlist"))
        
        // Appends the new TR question to the recursion question array
        recursionArray.append(temp2)
        
        // Used as temporary file for creating the TR questions to go in the arrays
        temp2 = TextResponseQuestion(questionText: "How many Binary Search function calls would be required to find the number 22? (Please enter an integer only.)", correctAnswer: "2", answerExplanation: "The number 22 will require 2 function calls to find it.", relatedImage: UIImage(named: "binarysearchlist"))
        
        // Appends the new TR question to the recursion question array
        recursionArray.append(temp2)
        
        // Used as temporary file for creating the TR questions to go in the arrays
        temp2 = TextResponseQuestion(questionText: "How many Binary Search function calls would be required to find the number 3? (Please enter an integer only.)", correctAnswer: "4", answerExplanation: "The number 3 will require 4 function calls which is the maximum number of calls required for a list of this size.", relatedImage: UIImage(named: "binarysearchlist"))
        
        // Appends the new TR question to the recursion question array
        recursionArray.append(temp2)
        
        // Used as temporary file for creating the MC questions to go in the arrays
        temp1 = MultipleChoiceQuestion(questionText: "A Binary Search algorithm requires the array to be...?", choiceA: "Unordered", choiceB: "Sorted", choiceC: "Small", choiceD: "Large", correctChoice: "B", answerExplanation: "A Binary Search algorithm requires that the array is sorted for it to work.", relatedImage: UIImage(named: "question"))
        
        // Appends the new MC question to the recursion question array
        recursionArray.append(temp1)
        
        // Used as temporary file for creating the MC questions to go in the arrays
        temp1 = MultipleChoiceQuestion(questionText: "The base case for a recursive Binary Search is?", choiceA: "min > max", choiceB: "max > min", choiceC: "min = 0", choiceD: "max == min", correctChoice: "A", answerExplanation: "The base case is if the min index is greater than the max index.", relatedImage: UIImage(named: "question"))
        
        // Appends the new MC question to the recursion question array
        recursionArray.append(temp1)
        
        // Used as temporary file for creating the MC questions to go in the arrays
        temp1 = MultipleChoiceQuestion(questionText: "The base case for a recursive Binary Search is?", choiceA: "min > max", choiceB: "max > min", choiceC: "min = 0", choiceD: "max == min", correctChoice: "A", answerExplanation: "The base case is if the min index is greater than the max index.", relatedImage: UIImage(named: "question"))
        
        // Appends the new MC question to the recursion question array
        recursionArray.append(temp1)
        
        // 15 Questions Done.
        
        
        
        // SORTING ALGORITHMS.
        
        
        
        // Used as temporary file for creating the MC questions to go in the arrays
        temp1 = MultipleChoiceQuestion(questionText: "What is the worst-case time complexity for Selection Sort?", choiceA: "O(log n)", choiceB: "O(1)", choiceC: "O(n²)", choiceD: "O(n)", correctChoice: "C", answerExplanation: "Selection sort has a worst-case time complexity of O(n²).", relatedImage: UIImage(named: "question"))
        
        // Appends the new MC question to the sorting algorithm question array
        sortingAlgorithmsArray.append(temp1)
        
        // Used as temporary file for creating the MC questions to go in the arrays
        temp1 = MultipleChoiceQuestion(questionText: "What is the worst-case time complexity for Bubble Sort?", choiceA: "O(n²)", choiceB: "O(1)", choiceC: "O(n log n)", choiceD: "O(n)", correctChoice: "A", answerExplanation: "Bubble sort has a worst-case time complexity of O(n²).", relatedImage: UIImage(named: "question"))
        
        // Appends the new MC question to the sorting algorithm question array
        sortingAlgorithmsArray.append(temp1)
        
        // Used as temporary file for creating the MC questions to go in the arrays
        temp1 = MultipleChoiceQuestion(questionText: "What is the worst-case time complexity for Insertion Sort?", choiceA: "O(log n)", choiceB: "O(1)", choiceC: "O(n)", choiceD: "O(n²)", correctChoice: "D", answerExplanation: "Insertion sort has a worst-case time complexity of O(n²).", relatedImage: UIImage(named: "question"))
        
        // Appends the new MC question to the sorting algorithm question array
        sortingAlgorithmsArray.append(temp1)
        
        // Used as temporary file for creating the MC questions to go in the arrays
        temp1 = MultipleChoiceQuestion(questionText: "Which of the following sorting algorithms requires two arrays?", choiceA: "Selection Sort", choiceB: "Bubble Sort", choiceC: "Quicksort", choiceD: "Insertion Sort", correctChoice: "A", answerExplanation: "Selection sort requires two arrays: the unordered input array and the output array.", relatedImage: UIImage(named: "question"))
        
        // Appends the new MC question to the sorting algorithm question array
        sortingAlgorithmsArray.append(temp1)
        
        // Used as temporary file for creating the MC questions to go in the arrays
        temp1 = MultipleChoiceQuestion(questionText: "Which of the following sorting algorithms is the least efficient in terms of memory?", choiceA: "Merge Sort", choiceB: "Bubble Sort", choiceC: "Selection Sort", choiceD: "Insertion Sort", correctChoice: "C", answerExplanation: "Selection sort is the least efficient in terms of memory as it requires 2 arrays.", relatedImage: UIImage(named: "question"))
        
        // Appends the new MC question to the sorting algorithm question array
        sortingAlgorithmsArray.append(temp1)
        
        // Used as temporary file for creating the TR questions to go in the arrays
        temp2 = TextResponseQuestion(questionText: "How many arrays does the selection sort algorithm require? (Please enter an integer only.)", correctAnswer: "2", answerExplanation: "The number 3 will require 4 function calls which is the maximum number of calls required for a list of this size.", relatedImage: UIImage(named: "question"))
        
        // Appends the new TR question to the sorting algorithm question array
        sortingAlgorithmsArray.append(temp2)
        
        // Used as temporary file for creating the MC questions to go in the arrays
        temp1 = MultipleChoiceQuestion(questionText: "Which of the following sorting algorithms makes use of a boolean variable?", choiceA: "Merge Sort", choiceB: "Bubble Sort", choiceC: "Selection Sort", choiceD: "Insertion Sort", correctChoice: "B", answerExplanation: "Bubble sort uses a boolean variable to keep track of if a swap has taken place while looping through the array values.", relatedImage: UIImage(named: "question"))
        
        // Appends the new MC question to the sorting algorithm question array
        sortingAlgorithmsArray.append(temp1)
        
        // Used as temporary file for creating the MC questions to go in the arrays
        temp1 = MultipleChoiceQuestion(questionText: "Which of the following sorting algorithms is the most efficient in terms of worst-case time complexity?", choiceA: "Quicksort", choiceB: "Bubble Sort", choiceC: "Selection Sort", choiceD: "Insertion Sort", correctChoice: "A", answerExplanation: "Quicksort is more complex than the other sorts, however, is also more efficient in a lot of cases.", relatedImage: UIImage(named: "question"))
        
        // Appends the new MC question to the sorting algorithm question array
        sortingAlgorithmsArray.append(temp1)
        
        // Used as temporary file for creating the MC questions to go in the arrays
        temp1 = MultipleChoiceQuestion(questionText: "Which of the following situations would it not be suitable to use Quicksort to sort the array?", choiceA: "Many Duplicate Items", choiceB: "Large Data Set", choiceC: "No Duplicate Items", choiceD: "Small Data Set", correctChoice: "A", answerExplanation: "Quicksort is more complex than the other sorts, however, is also more efficient in a lot of cases.", relatedImage: UIImage(named: "question"))
        
        // Appends the new MC question to the sorting algorithm question array
        sortingAlgorithmsArray.append(temp1)
        
        // Used as temporary file for creating the TR questions to go in the arrays
        temp2 = TextResponseQuestion(questionText: "Fill in the blank from the Bubble Sort image below.", correctAnswer: "true", answerExplanation: "If a swap takes place then the swapped variable must be set to true.", relatedImage: UIImage(named: "question"))
        
        // Appends the new TR question to the sorting algorithm question array
        sortingAlgorithmsArray.append(temp2)
        
        // Used as temporary file for creating the TR questions to go in the arrays
        temp2 = TextResponseQuestion(questionText: "Enter what should be in the bracket for this swap code.", correctAnswer: "i", answerExplanation: "In this case it should be 'i'. This can be worked out by looking at the other parts of the swap code.", relatedImage: UIImage(named: "swaptempqn"))
        
        // Appends the new TR question to the sorting algorithm question array
        sortingAlgorithmsArray.append(temp2)
        
        // Used as temporary file for creating the MC questions to go in the arrays
        temp1 = MultipleChoiceQuestion(questionText: "Which of the following sorting algorithms is efficient with large data sets?", choiceA: "Selection Sort", choiceB: "Bubble Sort", choiceC: "Quicksort", choiceD: "Insertion Sort", correctChoice: "C", answerExplanation: "Quicksort is efficient with large data sets.", relatedImage: UIImage(named: "question"))
        
        // Appends the new MC question to the sorting algorithm question array
        sortingAlgorithmsArray.append(temp1)
        
        // Used as temporary file for creating the MC questions to go in the arrays
        temp1 = MultipleChoiceQuestion(questionText: "Which of the following sorting algorithms works well with parallel processing?", choiceA: "Selection Sort", choiceB: "Bubble Sort", choiceC: "Insertion Sort", choiceD: "Quicksort", correctChoice: "D", answerExplanation: "Quicksort is efficient with large data sets.", relatedImage: UIImage(named: "question"))
        
        // Appends the new MC question to the sorting algorithm question array
        sortingAlgorithmsArray.append(temp1)
        
        // Used as temporary file for creating the TR questions to go in the arrays
        temp2 = TextResponseQuestion(questionText: "Which line of code below sets the temporary variable for the swap process. (Please enter the number of the line only.)", correctAnswer: "1", answerExplanation: "Line number 1 sets the temp variable to the value at the current index.", relatedImage: UIImage(named: "swap"))
        
        // Appends the new TR question to the sorting algorithm question array
        sortingAlgorithmsArray.append(temp2)
        
        // Used as temporary file for creating the MC questions to go in the arrays
        temp1 = MultipleChoiceQuestion(questionText: "Which of the following sorting algorithms makes use of the divide and conquer technique?", choiceA: "Bubble Sort", choiceB: "Quicksort", choiceC: "Insertion Sort", choiceD: "Selection Sort", correctChoice: "B", answerExplanation: "Quicksort is a recursive algorithm which makes use of the divide and conquer technique.", relatedImage: UIImage(named: "question"))
        
        // Appends the new MC question to the sorting algorithm question array
        sortingAlgorithmsArray.append(temp1)
        
        // 15 Questions Done.
        
        
        // OBJECT ORIENTED PROGRAMMING.
        
        
        
        // Used as temporary file for creating the MC questions to go in the arrays
        temp1 = MultipleChoiceQuestion(questionText: "A sub-class inherits from a...?", choiceA: "Instance", choiceB: "Super-class", choiceC: "Properties (Attributes)", choiceD: "Child-class", correctChoice: "B", answerExplanation: "Sub-classes inherit properties and methods from their super-classes.", relatedImage: UIImage(named: "OOPtree"))
        
        // Appends the new MC question to the OOP question array
        OOPArray.append(temp1)
        
        // Used as temporary file for creating the MC questions to go in the arrays
        temp1 = MultipleChoiceQuestion(questionText: "Data that is held within the object is a...?", choiceA: "Class", choiceB: "Super-class", choiceC: "Property (Attribute)", choiceD: "Method", correctChoice: "C", answerExplanation: "Properties are the data that is held within the object.", relatedImage: UIImage(named: "oopcar"))
        
        // Appends the new MC question to the OOP question array
        OOPArray.append(temp1)
        
        // Used as temporary file for creating the MC questions to go in the arrays
        temp1 = MultipleChoiceQuestion(questionText: "Which of the following is not an example of a type of method?", choiceA: "Constructor", choiceB: "Mutator", choiceC: "Getter", choiceD: "Finder", correctChoice: "D", answerExplanation: "Finder is not a type of method, whereas, the others are.", relatedImage: UIImage(named: "question"))
        
        // Appends the new MC question to the OOP question array
        OOPArray.append(temp1)
        
        temp1 = MultipleChoiceQuestion(questionText: "Which of the following could be a super-class of a Dog class?", choiceA: "Vehicle", choiceB: "Boat", choiceC: "Plant", choiceD: "Animal", correctChoice: "D", answerExplanation: "A dog is an animal, therefore animal is a possible super-class of dog.", relatedImage: UIImage(named: "question"))
        
        // Appends the new MC question to the OOP question array
        OOPArray.append(temp1)
        
        // Used as temporary file for creating the TR questions to go in the arrays
        temp2 = TextResponseQuestion(questionText: "Which of the classes is not a super-class of petrol or electric?", correctAnswer: "truck", answerExplanation: "The truck class is not a super-class, whereas car and vehicle are. ", relatedImage: UIImage(named: "ooptree"))
        
        // Appends the new TR question to the OOP question array
        OOPArray.append(temp2)
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
    
    @IBAction func takeTestButtonPressed(_ sender: Any) {
        
        getMixedRandomQuestions(recursionArray: recursionArray, OOPArray: OOPArray, sortingAlgorithmsArray: sortingAlgorithmsArray)
        
        score = 0
        
        question = questionArray[0]
        
        // Checks to see the type of the first question and then segues to the appropriate view controller.
        if question is MultipleChoiceQuestion {
            
            // Performs the segue
            performSegue(withIdentifier: "HomeToMultipleChoice", sender: nil)
            
        }
        else if question is TextResponseQuestion {
            
            // Peforms the segue
            performSegue(withIdentifier: "HomeToTextResponse", sender: nil)
            
        }
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Checks to see which segue is going to be performed and passes the corresponding array to the upcoming view controller.
        if segue.identifier == "HomeToRecursion" {
            
            // Sets the destination view controller and then passes the data to the corresponding variable in that view controller
            let destinationVC = segue.destination as! RecursionViewController
            destinationVC.recursionArray = recursionArray
            
        } else if segue.identifier == "HomeToSortingAlgorithms" {
            
            // Sets the destination view controller and then passes the data to the corresponding variable in that view controller
            let destinationVC = segue.destination as! SortingAlgorithmsViewController
            destinationVC.sortingAlgorithmsArray = sortingAlgorithmsArray
            
        } else if segue.identifier == "HomeToOOP" {
            
            // Sets the destination view controller and then passes the data to the corresponding variable in that view controller
            let destinationVC = segue.destination as! OOPViewController
            destinationVC.OOPArray = OOPArray
            
        } else if segue.identifier == "HomeToMultipleChoice" {
            
            // Sets the destination view controller and then passes the data to the corresponding variable in that view controller
            let destinationVC = segue.destination as! MultipleChoiceViewController
            destinationVC.question = question as! MultipleChoiceQuestion
            destinationVC.questionArray = questionArray
            destinationVC.nextQuestionIndex = 1
            destinationVC.score = score
            
        } else if segue.identifier == "HomeToTextResponse" {
            
            // Sets the destination view controller and then passes the data to the corresponding variable in that view controller
            let destinationVC = segue.destination as! TextResponseViewController
            destinationVC.question = question as! TextResponseQuestion
            destinationVC.questionArray = questionArray
            destinationVC.nextQuestionIndex = 1
            destinationVC.score = score
            
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

