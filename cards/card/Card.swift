//
//  Card.swift
//  cards
//
//  Created by hyperactive on 02/12/2018.
//  Copyright © 2018 hyperactive. All rights reserved.
//

import UIKit

class Card : DrawView {

    @IBOutlet var viewForWord: UIView!
    @IBOutlet var viewForTransishion: UIView!
    @IBOutlet var translate: UILabel!
    @IBOutlet var word: UILabel!
    var transitionOptions: UIViewAnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
    
    @IBAction func button1(_ sender: UIButton) {
        UIView.transition(from: self.viewForWord, to: self.viewForTransishion, duration: 0.6, options: transitionOptions){(completion)in
            self.viewForTransishion.isHidden = false
        }
    }
    @IBAction func button2(_ sender: UIButton) {
        UIView.transition(from: self.viewForTransishion, to: self.viewForWord, duration: 0.6, options: transitionOptions){(completion) in
         self.viewForTransishion.isHidden = true
        }
    }
    
}
