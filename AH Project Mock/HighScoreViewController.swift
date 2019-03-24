//
//  HighScoreViewController.swift
//  AH Project
//
//  Copyright © 2019 Jude Molloy. All rights reserved.
//

import UIKit

class HighScoreViewController: UIViewController {
    
    // Creates the variables that are required.
    var scoreArray:[Dictionary<String, Int>] = Array()
    var score = Dictionary<String, Int>()
    
    @IBOutlet weak var recursionScoreLabel: UILabel!
    
    @IBOutlet weak var OOPScoreLabel: UILabel!
    
    @IBOutlet weak var sortingAlgorithmsScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Calls the function to fetch the CSV data.
        fetchCSVData()
    
    }
    
    // Function that is called when home button is pressed.
    @IBAction func homeButtonPressed(_ sender: Any) {
        
        // Changes to home screen
        performSegue(withIdentifier: "HSToHome", sender: nil)
        
    }
    
    func fetchCSVData() {
        
        // Sets the file manager
        let fileManager = FileManager.default
        
        // Creates variable to store data from CSV file.
        var output: [Dictionary<String, Int>] = Array()
        
        do {
            // Sets the path
            let path = try fileManager.url(for: .documentDirectory, in: .allDomainsMask, appropriateFor: nil, create: true)
            let fileURL = path.appendingPathComponent("score.csv")
            
            // Gets data in string form
            let file = try String(contentsOf: fileURL)
            
            // Reads data into an array of dictionaries
            let rows = file.components(separatedBy: .newlines)
            for row in rows {
                let fields = row.replacingOccurrences(of: "\"", with: "").components(separatedBy: ",")
                output.append([fields[0]: Int(fields[1])!])
            }
        } catch {
            // Outputs error message to the console
            print(error)
        }
        
        // Calls the function to update screen data.
        updateScreenData(data: output)
        
    }
    
    func updateScreenData(data: [Dictionary<String, Int>]) {
        
        // Updates the data on the screen.
        recursionScoreLabel.text = String(data[0]["Recursion"]!)
        OOPScoreLabel.text = String(data[1]["OOP"]!)
        sortingAlgorithmsScoreLabel.text = String(data[2]["Sorting Algorithms"]!)
    }

}


