//
//  ChooseCorrectTranslateGameViewController.swift
//  cards
//
//  Created by hyperactive on 04/12/2018.
//  Copyright © 2018 hyperactive. All rights reserved.
//

import UIKit

class ChooseCorrectTranslateGameViewController: UIViewController {

    @IBOutlet var card: DrawView!
    @IBOutlet var wordLable: UILabel!
    
    var buttons: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StorgeOfWords.optionalTranslate = []
        update()
    }
    
    func update(){
        StorgeOfWords.randomWordsIncludingCurrentWord(){
            DispatchQueue.main.async {
                self.buttons = [self.button1,self.button2,self.button3]
                self.wordLable.text = StorgeOfWords.wordPerGameRound
                for index in 0..<self.self.buttons.count{
                    self.buttons[index].setTitle(StorgeOfWords.optionalTranslate[index], for: UIControlState.normal)
                }
            }
        }
        
    }
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    @IBAction func answerButton(_ sender: UIButton) {
        if sender.titleLabel?.text! == StorgeOfWords.translate {
            print("you right")
            sender.backgroundColor = UIColor.green
            UIView.animate(withDuration: 0.2){
                let storyBord = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyBord.instantiateViewController(withIdentifier: "WriteTranslateGame")
                self.present(vc, animated: true,completion: nil)
            }
        }else{
             sender.backgroundColor = UIColor.red
             print("you wrong")
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
