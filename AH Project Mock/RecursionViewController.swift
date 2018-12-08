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
        else if Int((fibonacciInput.text)!)! < 1 || Int((fibonacciInput.text)!)! > 100 {
            
            
            // Create alert to display validation message
            let alertController = UIAlertController(title: "Error", message:
                "The number is wrong", preferredStyle: UIAlertControllerStyle.alert)
            
            alertController.addAction(UIAlertAction(title: "Retry", style: UIAlertActionStyle.default,handler: nil))
            
            // Display the alert that has just been created
            self.present(alertController, animated: true, completion: nil)
            
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
