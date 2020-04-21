//
//  MainGameViewController.swift
//  cards
//
//  Created by hyperactive on 02/12/2018.
//  Copyright © 2018 hyperactive. All rights reserved.
//

import UIKit

class MainGameViewController: UIViewController {

    @IBOutlet var card: Card!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StorgeOfWords.giveMeNewWordForNewRound(completion: {
            DispatchQueue.main.async {
                if StorgeOfWords.wordPerGameRound != "" {
                    self.card.word.text! = StorgeOfWords.wordPerGameRound
                    self.card.translate.text! = StorgeOfWords.translate
                } else {
                    let storyBord = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyBord.instantiateViewController(withIdentifier: "LarningCards")
                    self.present(vc, animated: true, completion: nil)
                }
            }
        })
    }
  
    @IBAction func cancel(_ sender: UIButton) {
        let storyBord = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBord.instantiateViewController(withIdentifier: "LarningCards")
        self.present(vc, animated: true, completion: nil)
    }
    
}

