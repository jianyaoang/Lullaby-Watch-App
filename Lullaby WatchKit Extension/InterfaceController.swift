//
//  InterfaceController.swift
//  Lullaby WatchKit Extension
//
//  Created by VLT Labs on 6/7/15.
//  Copyright (c) 2015 Jay Ang. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var countdownTimer: WKInterfaceTimer!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        creatingTimerCountdown()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    func creatingTimerCountdown() {
        
        var lullabyHour = 10
        var lullabyMinute = 42
    
        var now = NSDate()
        var calendar = NSCalendar.currentCalendar()
        var calendarTomorrow = calendar.components(NSCalendarUnit.EraCalendarUnit | NSCalendarUnit.YearCalendarUnit | NSCalendarUnit.MonthCalendarUnit | NSCalendarUnit.DayCalendarUnit, fromDate: now)
        calendarTomorrow.hour = lullabyHour
        calendarTomorrow.minute = lullabyMinute
        
        var lullabyTime = calendar.dateFromComponents(calendarTomorrow)
        
        if lullabyTime?.timeIntervalSinceDate(now) < 0 {
            
            var addingOneDay = NSDateComponents()
            addingOneDay.day = 1
            lullabyTime = calendar.dateByAddingComponents(addingOneDay, toDate: lullabyTime!, options: nil)
            
        }
        
        
        self.countdownTimer.setDate(lullabyTime!)
        self.countdownTimer.start()
    }
    
}
