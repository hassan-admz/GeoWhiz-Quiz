//
//  PointsContainerView.swift
//  GeoWhiz Quiz
//
//  Created by Hassan Mayers on 29/2/24.
//

import UIKit

class PointsContainerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        // Ensures the view's background is transparent
        self.backgroundColor = .clear
        
        // Sets up the border properties
        self.layer.borderWidth = 2 // Adjust the border width as needed
        self.layer.borderColor = UIColor.gray.cgColor // Sets the border color to gray
        
        // Makes the view's corners rounded, achieving a pill shape
        // The cornerRadius will be set/updated to half of the view's height to ensure the pill shape
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.bounds.height / 2
    }
}
