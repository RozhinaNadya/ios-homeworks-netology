//
//  Timer.swift
//  Navigation
//
//  Created by Надежда on 2022-06-20.
//

import UIKit

class MyTimer {
    
    var timerAction: (() -> Void)?
    
    init() {
        let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: .none, repeats: true)
        timer.fire()
        RunLoop.current.add(timer, forMode: .common)
    }
    
    @objc
    func fireTimer() {
        timerAction?()
    }
}
