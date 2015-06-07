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
        

    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        creatingTimerCountdown()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    func creatingTimerCountdown() {
        
        if NSUserDefaults.standardUserDefaults().objectForKey("hour") == nil {
            NSUserDefaults.standardUserDefaults().setObject(22, forKey: "hour")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
        
        if NSUserDefaults.standardUserDefaults().objectForKey("minute") == nil {
            NSUserDefaults.standardUserDefaults().setObject(00, forKey: "minute")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
        
        var lullabyHour =  NSUserDefaults.standardUserDefaults().objectForKey("hour") as! Int
        var lullabyMinute =  NSUserDefaults.standardUserDefaults().objectForKey("minute") as! Int
    
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
    
    
    @IBAction func onMenuItemPressed() {
        self.presentControllerWithName("LullabySetting", context: nil)
    }
    
}
