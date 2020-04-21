//
//  LessensViewController.swift
//  cards
//
//  Created by hyperactive on 02/12/2018.
//  Copyright © 2018 hyperactive. All rights reserved.
//

import UIKit

class LessensViewController: UIViewController {

    @IBOutlet var lesson2: DrawView!
    @IBOutlet var lesson1: DrawView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func lesson1(_ sender: UIButton) {
        StorgeOfWords.lessonNumber = 1
        StorgeOfWords.youCanUseWithThisWords()
    }
    @IBAction func lesson2(_ sender: UIButton) {
        StorgeOfWords.lessonNumber = 2
        StorgeOfWords.youCanUseWithThisWords()
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
