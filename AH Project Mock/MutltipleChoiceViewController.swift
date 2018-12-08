//
//  MutltipleChoiceViewController.swift
//  AH Project Mock
//
//  Created by Jude Molloy on 30/11/2018.
//  Copyright © 2018 Jude Molloy. All rights reserved.
//

import UIKit

class MutltipleChoiceViewController: UIViewController {
    
    // Links to the UI features of on screen elements
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var relatedImage: UIImageView!
    
    
    @IBOutlet weak var choiceAbutton: RoundedButton!
    @IBOutlet weak var choiceBbutton: RoundedButton!
    @IBOutlet weak var choiceCbutton: RoundedButton!
    @IBOutlet weak var choiceDbutton: RoundedButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func choiceAbuttonPressed(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Correct!", message:
            "A is the correct answer!", preferredStyle: UIAlertControllerStyle.alert)
        
        alertController.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }

    @IBAction func choiceBbuttonPressed(_ sender: Any) {
        let alertController = UIAlertController(title: "Incorrect!", message:
            "B is the incorrect correct answer.", preferredStyle: UIAlertControllerStyle.alert)
        
        alertController.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func choiceCbuttonPressed(_ sender: Any) {
        let alertController = UIAlertController(title: "Incorrect!", message:
            "C is the incorrect correct answer.", preferredStyle: UIAlertControllerStyle.alert)
        
        alertController.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func choiceDbuttonPressed(_ sender: Any) {
        let alertController = UIAlertController(title: "Incorrect!", message:
            "D is the incorrect correct answer.", preferredStyle: UIAlertControllerStyle.alert)
        
        alertController.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
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
