//
//  CreateJobContainerViewController.swift
//  Jobim
//
//  Created by hyperactive on 04/11/2018.
//  Copyright © 2018 hyperactive. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

        //Manipulating container views
        fileprivate weak var viewController : UIViewController!
        //Keeping track of containerViews
        fileprivate var containerViewObjects = Dictionary<String,UIViewController>()
        // Pass in a tuple of required TimeInterval with UIViewAnimationOptions
        var animationDurationWithOptions:(TimeInterval, UIViewAnimationOptions) = (0,[])
        
        // Specifies which ever container view is on the front
        open var currentViewController : UIViewController{
            get {
                return self.viewController
            }
        }
    
        fileprivate var segueIdentifier : String!
    
        //Identifier For First Container SubView
        @IBInspectable internal var firstLinkedSubView : String!
 
        open override func viewDidAppear(_ animated: Bool) {
            if let identifier = firstLinkedSubView{
                segueIdentifierReceivedFromParent(identifier)
            }
        }
    
        func segueIdentifierReceivedFromParent(_ identifier: String){
            self.segueIdentifier = identifier
            self.performSegue(withIdentifier: self.segueIdentifier, sender: nil)
        }
    
        override open func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == segueIdentifier{
                //Remove Container View
                if viewController != nil{
                    viewController.view.removeFromSuperview()
                    viewController = nil
                }
                //Add to dictionary if isn't already there
                if ((self.containerViewObjects[self.segueIdentifier] == nil)){
                    viewController = segue.destination
                    self.containerViewObjects[self.segueIdentifier] = viewController
                }else{
                    for (key, value) in self.containerViewObjects{
                        if key == self.segueIdentifier{
                            viewController = value
                        }
                    }
                }
                UIView.transition(with: self.view, duration: animationDurationWithOptions.0, options: animationDurationWithOptions.1, animations: {
                    self.addChildViewController(self.viewController)
                    self.viewController.view.frame = CGRect(x: 0,y: 0, width: self.view.frame.width,height: self.view.frame.height)
                    self.view.addSubview(self.viewController.view)
                }, completion: { (complete) in
                    self.viewController.didMove(toParentViewController: self)
                })
            }
        }
}
