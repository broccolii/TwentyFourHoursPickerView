//
//  ViewController.swift
//  UIDatePicker
//
//  Created by Broccoli on 15/11/24.
//  Copyright © 2015年 Broccoli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hourPickerView = TwentyFourHoursPickerView(frame: CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: 216))
        hourPickerView.didSelectRowBlock = {
            (hour, minute) -> Void in
            debugPrint("hour:\(hour), minute: \(minute)")
        }
        view.addSubview(hourPickerView)
        
        let datePickerView = UIDatePicker(frame: CGRect(x: 0, y: 300, width: UIScreen.mainScreen().bounds.width, height: 216))
        datePickerView.datePickerMode = UIDatePickerMode.Time
        view.addSubview(datePickerView)
    }
}

