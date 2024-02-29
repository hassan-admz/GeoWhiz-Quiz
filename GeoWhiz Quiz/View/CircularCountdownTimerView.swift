//
//  CircularCountdownTimerView.swift
//  GeoWhiz Quiz
//
//  Created by Hassan Mayers on 29/2/24.
//

import UIKit

class CircularCountdownTimerView: UIView {
    
    let shape = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayer()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayer()
    }
    
    private func setupLayer() {
        let circlePath = UIBezierPath(arcCenter: self.center, radius: 50, startAngle: 0, endAngle: .pi * 2, clockwise: true)
        
        shape.path = circlePath.cgPath
        shape.lineWidth = 15
        shape.strokeColor = UIColor.blue.cgColor
        shape.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(shape)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        // Update the shape layer's frame or path based on the view's new layout
        shape.frame = bounds
    }
}

