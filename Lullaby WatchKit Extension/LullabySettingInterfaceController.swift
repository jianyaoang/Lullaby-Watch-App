//
//  LullabySettingInterfaceController.swift
//  Lullaby
//
//  Created by VLT Labs on 6/7/15.
//  Copyright (c) 2015 Jay Ang. All rights reserved.
//

import WatchKit
import Foundation


class LullabySettingInterfaceController: WKInterfaceController {

    @IBOutlet weak var lullabyTimeLabel: WKInterfaceLabel!
    @IBOutlet weak var setHourSlider: WKInterfaceSlider!
    @IBOutlet weak var setMinuteSlider: WKInterfaceSlider!
    @IBOutlet weak var hourLabel: WKInterfaceLabel!
    @IBOutlet weak var minuteLabel: WKInterfaceLabel!
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        if NSUserDefaults.standardUserDefaults().objectForKey("hour") == nil {
            NSUserDefaults.standardUserDefaults().setObject(22, forKey: "hour")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
        
        if NSUserDefaults.standardUserDefaults().objectForKey("minute") == nil {
            NSUserDefaults.standardUserDefaults().setObject(00, forKey: "minute")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
        
        var hour = NSUserDefaults.standardUserDefaults().objectForKey("hour") as! Int
        var minute = NSUserDefaults.standardUserDefaults().objectForKey("minute")as! Int
        
        self.setHourSlider.setValue(Float(hour))
        self.setMinuteSlider.setValue(Float(minute))
        
        updateValueOfLabels()
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func updateValueOfLabels() {
        var hour = NSUserDefaults.standardUserDefaults().objectForKey("hour") as! Int
        var minute = NSUserDefaults.standardUserDefaults().objectForKey("minute")as! Int
        
        self.hourLabel.setText("\(hour)")
        self.minuteLabel.setText("\(minute)")
        
        self.lullabyTimeLabel.setText("\(hour):\(minute)")
    }
    
    @IBAction func onSetHourSliderPressed(value: Float) {
        
        var valueOfSlider = Int(value)
        NSUserDefaults.standardUserDefaults().setObject(valueOfSlider, forKey: "hour")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        updateValueOfLabels()
    }
    
    @IBAction func onSetMinuteSliderPressed(value: Float) {
        
        var valueOfSlider = Int(value)
        NSUserDefaults.standardUserDefaults().setObject(valueOfSlider, forKey: "minute")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        updateValueOfLabels()
    }

}
