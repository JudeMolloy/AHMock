//
//  ViewController.swift
//  AH Project Mock
//
//  Created by Jude Molloy on 05/11/2018.
//  Copyright © 2018 Jude Molloy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var recursionArray: [Any] = []

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
        
        // Used as temporary file for creating the TR questions to go in the arrays
        var temp2 = TextResponseQuestion(questionText: "Which line in the code below is the base case for the recursive function? (Please enter the number of the line only.)", correctAnswer: "2", answerExplanation: "Line number 2 is the base case line as it is the condition that stops the", relatedImage: UIImage(named: "Fibonacci Code"))
        
        // Appends the new TR question to the recursion question array
        recursionArray.append(temp2)
        

        
    }
    
    
    @IBAction func recursionButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "HomeToRecursion", sender: nil)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
        let destinationVC = segue.destination as! RecursionViewController
        destinationVC.recursionArray = recursionArray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

