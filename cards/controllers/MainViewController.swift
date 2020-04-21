//
//  ViewController.swift
//  cards
//
//  Created by hyperactive on 02/12/2018.
//  Copyright © 2018 hyperactive. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var container: ContainerViewController!

    @IBOutlet var viewForCurrentViewController: UIView!
    var currentRectForLittelView: CGRect!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        container!.segueIdentifierReceivedFromParent("Lessons")
        viewForCurrentViewController.frame = CGRect(x: 18, y: 158, width: 69, height: 2)
    }
    
    @IBAction func cardsToLessonsSwipeActio(_ sender: UIButton) {
        currentRectForLittelView = CGRect(x: sender.frame.minX-1, y: sender.frame.maxY, width: sender.frame.width+1, height: 2)
        UIView.animate(withDuration: 0.4){
            self.viewForCurrentViewController.frame = self.currentRectForLittelView
        }
        if sender.titleLabel?.text == "Lesson"{
            container!.segueIdentifierReceivedFromParent("Lessons")
        } else {
            container!.segueIdentifierReceivedFromParent("Cards")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Container" {
            container = segue.destination as! ContainerViewController
            container.animationDurationWithOptions = (0.2, .transitionCrossDissolve)
        }
    }
    
}

