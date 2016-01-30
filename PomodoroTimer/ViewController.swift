//
//  ViewController.swift
//  PomodoroTimer
//
//  Created by 川上智樹 on 2016/01/09.
//  Copyright © 2016年 yatuhasiumai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var meridiemLabel: UILabel!

    let clockView = ClockView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        clockView.frame.size = CGSize(width: 300, height: 300)
        clockView.center = view.center
        clockView.backgroundColor = UIColor.clearColor()
        view.addSubview(clockView)
        
        update()
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "update", userInfo: nil, repeats: true)
    }
    
    func update() {
        let now = NSDate()
        let calendar = NSCalendar.currentCalendar()
        //        let flag = NSCalendarUnit.Year   |
        //                  NSCalendarUnit.Month   |
        //                  NSCalendarUnit.Day     |
        //                  NSCalendarUnit.Hour    |
        //                  NSCalendarUnit.Minute  |
        //                  NSCalendarUnit.Second
        
        //        let flag: Set = [NSCalendarUnit.Year,
        //                    NSCalendarUnit.Month,
        //                    NSCalendarUnit.Day,
        //                    NSCalendarUnit.Hour,
        //                    NSCalendarUnit.Minute,
        //                    NSCalendarUnit.Second]
        
        let components = calendar.components([.Year, .Month, .Day, .Hour, .Hour, .Minute, .Second], fromDate: now)
        
        let year = components.year
        let month = components.month
        let day = components.day
        let hour = components.hour
        let minute = components.minute
        let second = components.second
        
        timeLabel.text = String(String(format: "%02d:%02d:%02d", hour, minute, second))
        dateLabel.text = String(String(format: "%04d:%02d:%02d", year, month, day))
        
        if hour < 12 {
            meridiemLabel.text = "AM"
        } else {
            meridiemLabel.text = "PM"
        }
        
        clockView.hour = hour
        clockView.minute = minute
        clockView.second = second
        
        clockView.setNeedsDisplay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

