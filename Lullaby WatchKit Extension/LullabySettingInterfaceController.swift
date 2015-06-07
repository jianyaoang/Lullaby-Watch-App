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
        
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func onSetHourSliderPressed(value: Float) {
        
        self.hourLabel.setText("\(value)")
        
    }
    
    @IBAction func onSetMinuteSliderPressed(value: Float) {
        
        self.minuteLabel.setText("\(value)")
        
    }

}
