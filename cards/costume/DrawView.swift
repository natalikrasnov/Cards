//
//  view.swift
//  Jobim
//
//  Created by hyperactive on 31/10/2018.
//  Copyright © 2018 hyperactive. All rights reserved.
//

import UIKit

class DrawView: UIView {

    var path: UIBezierPath!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.darkGray.withAlphaComponent(0)
    }
    
    func createRectangle() {
        let rect = CGRect(x: 0, y: 0, width: 249, height: 249)
        path = UIBezierPath(roundedRect: rect, cornerRadius: 50)
    }
    
    override func draw(_ rect: CGRect) {
        self.createRectangle()
       //  Specify the fill color and apply it to the path.
        UIColor.white.setFill()
        path.fill()
        // Specify a border (stroke) color.
        UIColor.gray.setStroke()
        path.stroke()
    }
}
