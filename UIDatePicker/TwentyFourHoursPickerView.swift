//
//  HourTimePickerView.swift
//  UIDatePicker
//
//  Created by Broccoli on 15/11/24.
//  Copyright © 2015年 Broccoli. All rights reserved.
//

import UIKit

class TwentyFourHoursPickerView: UIPickerView {
    
    lazy var hourArr: [String] = {
        var arr = [String]()
        for num in 0 ..< 24 {
            arr.append(String(format: "%02d", num))
        }
        return arr
    }()
    
    lazy var minuteArr: [String] = {
        var arr = [String]()
        for num in 0 ..< 60 {
            arr.append(String(format: "%02d", num))
        }
        return arr
    }()
    
    var currentHour = "00"
    var currentMinute = "00"
    
    var didSelectRowBlock: ((String, String) -> Void)?
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: 216))
        dataSource = self
        delegate = self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        dataSource = self
        delegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func willMoveToSuperview(newSuperview: UIView?) {
        let date = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH"
        let hour = Int(dateFormatter.stringFromDate(date))!
        dateFormatter.dateFormat = "mm"
        let minute = Int(dateFormatter.stringFromDate(date))!
        
        self.selectRow(65536 / 2 - 8 + hour, inComponent: 2, animated: false)
        self.selectRow(65536 / 2 - 8 + minute, inComponent: 3, animated: false)
    }
}

extension TwentyFourHoursPickerView: UIPickerViewDataSource {
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 6
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 2:
            return 65536
        case 3:
            return 65536
        default :
            return 0
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 2:
            currentHour = hourArr[row % 24]
        case 3:
            currentMinute = minuteArr[row % 60]
        default :
            break
        }
        
        if let _ = didSelectRowBlock {
            didSelectRowBlock!(currentHour, currentMinute)
        }
    }
}

extension TwentyFourHoursPickerView: UIPickerViewDelegate {
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 2:
            return hourArr[row % 24]
        case 3:
            return minuteArr[row % 60]
        default :
            return ""
        }
    }
}

