//
//  ClockView.swift
//  PomodoroTimer
//
//  Created by 川上智樹 on 2016/01/30.
//  Copyright © 2016年 yatuhasiumai. All rights reserved.
//

import UIKit

class ClockView: UIView {
    
    var hour = 0
    var minute = 0
    var second = 0
    
    
    
    override func drawRect(rect: CGRect) {
        
        let center = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        let radius = self.frame.height / 2 - 2.5
        let clockwise = true
        let startAngle = M_PI * 3 / 2
        let endAngle = M_PI * 3 / 2 + 2 * M_PI
        
        let baseCircle = UIBezierPath(arcCenter: center, radius: radius, startAngle: CGFloat(startAngle), endAngle: CGFloat(endAngle), clockwise: clockwise)
        baseCircle.lineWidth = 5
        
        UIColor(red: 1.0, green: 1.0, blue: 0.7, alpha: 1.0).setStroke()
        baseCircle.setLineDash([1.0, 5.0], count: 2, phase: 0)
        
        baseCircle.stroke()
        
        let daySeconds = 12 * 60 * 60
        
        var seconds = second
        seconds += minute * 60
        
        if hour >= 12 {
            seconds += (hour - 12) * 60 * 60
        } else {
            seconds += hour * 60 * 60
        }
        
        let percent = Double(seconds) / Double(daySeconds)
        
        let timeEndAngle = M_PI * 3 / 2 + percent * 2 * M_PI
        
        let timeCircle = UIBezierPath(arcCenter: center, radius: radius - 10, startAngle: CGFloat(startAngle), endAngle: CGFloat(timeEndAngle), clockwise: clockwise)
        
        timeCircle.lineWidth = 2
        UIColor(red: 214.0 / 255, green: 95.0 / 255, blue: 7.6 / 255, alpha: 1.0).setStroke()
        
        timeCircle.stroke()
    }
}
