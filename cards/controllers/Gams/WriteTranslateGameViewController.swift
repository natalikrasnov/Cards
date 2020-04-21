//
//  WriteTranslateGameViewController.swift
//  cards
//
//  Created by hyperactive on 04/12/2018.
//  Copyright © 2018 hyperactive. All rights reserved.
//

import UIKit

class WriteTranslateGameViewController: UIViewController {

    @IBOutlet var card: DrawView!
    @IBOutlet var wordLble: UILabel!
    @IBOutlet var answerTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     wordLble.text = StorgeOfWords.wordPerGameRound
    }

    @IBAction func checkThisWord(_ sender: UIButton) {
        if StorgeOfWords.translate == answerTextField.text{
            print("you right")
            let storyBord = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBord.instantiateViewController(withIdentifier: "MainGame")
            self.present(vc, animated: true,completion: nil)
        }else{
            print("you wrong")
            answerTextField.textColor = UIColor.red
            
             UIView.animate(withDuration: 0.2){
                self.answerTextField.text! = StorgeOfWords.translate
                self.answerTextField.textColor = UIColor.green
            }
        }
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        let storyBord = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBord.instantiateViewController(withIdentifier: "LarningCards")
        self.dismiss(animated: true){
            self.present(vc, animated: true, completion: nil)
        }
    }
    
}
