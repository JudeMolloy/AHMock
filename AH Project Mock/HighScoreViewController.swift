//
//  HighScoreViewController.swift
//  AH Project Mock
//
//  Created by Jude Molloy on 25/02/2019.
//  Copyright © 2019 Jude Molloy. All rights reserved.
//

import UIKit

class HighScoreViewController: UIViewController {
    
    var scoreArray:[Dictionary<String, Int>] = Array()
    var score = Dictionary<String, Int>()
    
    @IBOutlet weak var recursionScoreLabel: UILabel!
    
    @IBOutlet weak var OOPScoreLabel: UILabel!
    
    @IBOutlet weak var sortingAlgorithmsScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        score = ["Recursion": 0]
        scoreArray.append(score)
        
        score = ["OOP": 2]
        scoreArray.append(score)
        
        score = ["Sorting Algorithms": 3]
        scoreArray.append(score)
        
        print(scoreArray)
        generateCSV(from: scoreArray)
    
        
    }
    
    func generateCSV(from array:[Dictionary<String, Int>]) {
        
        var csvString = ""
        
        
        csvString = csvString.appending("Recursion,\(String(describing: scoreArray[0]["Recursion"]!))\n")
        
        csvString = csvString.appending("OOP,\(String(describing: scoreArray[1]["OOP"]!))\n")
        
        csvString = csvString.appending("Sorting Algorithms,\(String(describing: scoreArray[2]["Sorting Algorithms"]!))")
        
        print(csvString)
        
        
        let fileManager = FileManager.default
        
        do {
            let path = try fileManager.url(for: .documentDirectory, in: .allDomainsMask, appropriateFor: nil, create: false)
            let fileURL = path.appendingPathComponent("score.csv")
            try csvString.write(to: fileURL, atomically: true, encoding: .utf8)
            print("it worked")
        } catch {
            print(("Error creating file"))
        }
        
        var output: [Dictionary<String, Int>] = Array()
        do {
            let path = try fileManager.url(for: .documentDirectory, in: .allDomainsMask, appropriateFor: nil, create: false)
            let fileURL = path.appendingPathComponent("score.csv")
            let file = try String(contentsOf: fileURL)
            let rows = file.components(separatedBy: .newlines)
            for row in rows {
                let fields = row.replacingOccurrences(of: "\"", with: "").components(separatedBy: ",")
                print(fields)
                output.append([fields[0]: Int(fields[1])!])
                print("NOWNWNWOOW")
                print(fields)
            }
        } catch {
            print(error)
        }
        
        print("THIS IS THE OUTPUT DICT")
        print(output)
        updateScreenData(data: output)
        
    }
    
    func updateScreenData(data: [Dictionary<String, Int>]) {
        recursionScoreLabel.text = String(data[0]["Recursion"]!)
        OOPScoreLabel.text = String(data[1]["OOP"]!)
        sortingAlgorithmsScoreLabel.text = String(data[2]["Sorting Algorithms"]!)
    }

}



//override func viewDidLoad() {
//    super.viewDidLoad()
//
//    let fileName = "test"
//    let documentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
//    let fileURL = documentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
//    print("File Path: \(fileURL.path)")
//
//    let writeString = "Write this text to the file in swift."
//    do {
//        try writeString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
//    } catch let error as NSError {
//        print("Failed to write to URL")
//        print(error)
//    }
//
//    var readString = ""
//    do {
//        readString = try String(contentsOf: fileURL)
//    } catch let error as NSError{
//        print("Failed to read file.")
//        print(error)
//    }
//
//    print("Contents of the file.")
//    print(readString)
//
//}


