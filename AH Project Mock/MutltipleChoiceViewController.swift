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
    var topic: String?
    
    var question: MultipleChoiceQuestion?
    var score: Int?
    
    // Function that is called when home button is pressed.
    @IBAction func homeButtonPressed(_ sender: Any) {
        
        // Changes to the home screen
        performSegue(withIdentifier: "MultipleChoiceToHome", sender: nil)
        
    }
    
    // Links to the UI features of on screen elements
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var relatedImage: UIImageView!
    
    @IBOutlet weak var choiceAbutton: RoundedButton!
    @IBOutlet weak var choiceBbutton: RoundedButton!
    @IBOutlet weak var choiceCbutton: RoundedButton!
    @IBOutlet weak var choiceDbutton: RoundedButton!
    
    // Creates the variable to store the controller for the incorrect message alert.
    var incorrectAlertController: UIAlertController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call the function to set all of the question data to the UI elements
        setScreenData(question: question)
        
    }
    
    func setScreenData(question: MultipleChoiceQuestion?) {
        // Sets all of the on screen elements to the data that was passed to this view controller
        questionText.text = question?.questionText
        choiceAbutton.setTitle(question?.choiceA, for: .normal)
        choiceBbutton.setTitle(question?.choiceB, for: .normal)
        choiceCbutton.setTitle(question?.choiceC, for: .normal)
        choiceDbutton.setTitle(question?.choiceD, for: .normal)
        
        // If the question has a related image then this will set the screen to display the image.
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
        let restart = [["Recursion": 0], ["OOP": 0], ["Sorting Algorithms": 0]]
        // updateCSVData(scoreArray: restart)
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
            // Displays the incorrect alert.
            self.present(incorrectAlertController as! UIViewController, animated: true, completion: nil)
            
        }
    }
    
    func nextQuestion() {
        // Checks if there is a next question and if there is, it fetches the next question.
        if questionArray.count > nextQuestionIndex! {
            var nextQuestion = questionArray[nextQuestionIndex!]
            
            // Checks to see the type of the next question and then segues to the appropriate view controller or just changes the data on the current screen.
            if nextQuestion is MultipleChoiceQuestion {
                
                question = questionArray[nextQuestionIndex!] as! MultipleChoiceQuestion
                
                setScreenData(question: question)
            }
            else if nextQuestion is TextResponseQuestion {
                
                // Peforms the segue
                performSegue(withIdentifier: "MultipleChoiceToTextResponse", sender: nil)
                
            }
            // Increments the index value by 1
            nextQuestionIndex = nextQuestionIndex! + 1
        } else {
            
            // Calls the function to update the high score in the CSV file if tehre is a new one.
            updateHighScore(score: score!)
            
            
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
    
    func updateHighScore(score: Int) {
        
        // Sets the constant to hold the file manager.
        let fileManager = FileManager.default
        
        // Creates a variable to store the high score data.
        var data: [Dictionary<String, Int>] = Array()
        
        // Trys to access the file and watches for errors
        do {
            // Sets the required variables.
            let path = try fileManager.url(for: .documentDirectory, in: .allDomainsMask, appropriateFor: nil, create: false)
            let fileURL = path.appendingPathComponent("score.csv")
            let file = try String(contentsOf: fileURL)
            let rows = file.components(separatedBy: .newlines)
            
            // Parses the data into usable format and is added to an array.
            for row in rows {
                let fields = row.replacingOccurrences(of: "\"", with: "").components(separatedBy: ",")
                data.append([fields[0]: Int(fields[1])!])
            }
        } catch {
            // Outputs the error message to the console.
            print(error)
        }
        
        
        // Checks to see which topic the score should possibly be updated for.
        // It will then check to see if it is a new high score and if so it will change the score in the dictionary and call the update CSV file function.
        if topic == "Recursion" {
            
            if score > data[0]["Recursion"]! {
                data[0]["Recursion"] = score
                updateCSVData(scoreArray: data)
            }
            
        } else if topic == "OOP" {
            
            if score > data[1]["OOP"]! {
                data[1]["OOP"] = score
                updateCSVData(scoreArray: data)
            }
            
        } else if topic == "Sorting Algorithms" {
            
            if score > data[2]["Sorting Algorithms"]! {
                data[2]["Sorting Algorithms"] = score
                updateCSVData(scoreArray: data)
                
            }
        }
    }
    
    func updateCSVData(scoreArray: [Dictionary<String, Int>]) {
        
        // Sets the constant to hold the file manager.
        let fileManager = FileManager.default
        
        // Creates the variable to sotre the data to be inserted into the CSV file.
        var csvString = ""
        
        // Adds the data for each of the topic to the CSV input string.
        csvString = csvString.appending("Recursion,\(String(describing: scoreArray[0]["Recursion"]!))\n")
        
        csvString = csvString.appending("OOP,\(String(describing: scoreArray[1]["OOP"]!))\n")
        
        csvString = csvString.appending("Sorting Algorithms,\(String(describing: scoreArray[2]["Sorting Algorithms"]!))")
        
        // Attempts to access and write to the CSV file whilst waiting to catch errors.
        do {
            // Sets the relevant variables to access the file.
            let path = try fileManager.url(for: .documentDirectory, in: .allDomainsMask, appropriateFor: nil, create: false)
            let fileURL = path.appendingPathComponent("score.csv")
            
            // Trys to write to the CSV file with the input data.
            try csvString.write(to: fileURL, atomically: true, encoding: .utf8)        } catch {
                // Ouputs error to console.
                print(("Error creating the file."))
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
                destinationVC.topic = topic
                
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
