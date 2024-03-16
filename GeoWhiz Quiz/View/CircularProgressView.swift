//
//  CircularProgressView.swift
//  GeoWhiz Quiz
//
//  Created by user on 2/3/24.
//

import UIKit

class CircularProgressView: UIView {
    
    private var progressLayer = CAShapeLayer()
    private var trackLayer = CAShapeLayer()
    private var progressLabel = UILabel()
    private var duration = 30 // Total duration of the countdown
    private var countdownTimer: Timer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTrackLayer()
        setupProgressLayer()
        setupProgressLabel()
        startCountdown()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTrackLayer() {
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2, y: frame.size.height / 2), radius: 40, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        trackLayer.path = circularPath.cgPath
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 10
        trackLayer.lineCap = .round
        layer.addSublayer(trackLayer)
    }
    
    private func setupProgressLayer() {
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2, y: frame.size.height / 2), radius: 40, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        progressLayer.path = circularPath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = UIColor.blue.cgColor
        progressLayer.lineWidth = 10
        progressLayer.lineCap = .round
        progressLayer.strokeEnd = 0
        layer.addSublayer(progressLayer)
    }
    
    private func setupProgressLabel() {
        progressLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        progressLabel.center = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        progressLabel.textAlignment = .center
        progressLabel.text = "\(duration)"
        progressLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        addSubview(progressLabel)
    }
    
    private func startCountdown() {
        countdownTimer?.invalidate()
        // Configure the animation for the progress layer
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = CFTimeInterval(duration+8)
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        progressLayer.add(animation, forKey: "progressAnim")
        
        // Start the timer to update the label
        var remainingSeconds = duration
       countdownTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            remainingSeconds -= 1
            self.progressLabel.text = "\(remainingSeconds)"
            
            if remainingSeconds <= 0 {
                timer.invalidate()
            }
        }
    }
    
    // Public method to reset and restart the countdown
    func resetCountdown(newDuration: Int? = nil) {
        if let newDuration = newDuration {
            self.duration = newDuration
        }
        
        progressLayer.strokeEnd = 0
        progressLabel.text = "\(duration)"
        startCountdown() // Call startCountdown to reset and start over
    }
}

