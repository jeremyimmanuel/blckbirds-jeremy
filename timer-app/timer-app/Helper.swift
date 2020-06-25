//
//  Helper.swift
//  timer-app
//
//  Created by Jeremy's Macbook Pro 16 on 6/24/20.
//  Copyright © 2020 Jeremy Tandjung. All rights reserved.
//

import Foundation

enum TimerMode {
    case running
    case paused
    case initial
}

func secondsToMinutesAndSeconds(_ seconds: Int) -> String {
    let minutes = "\((seconds % 3600) / 60)"
    let seconds = "\((seconds % 3600) % 60)"
    
    let minuteStamp = minutes.count > 1 ? minutes : "0\(minutes)"
    let secondStamp = seconds.count > 1 ? seconds : "0\(seconds)"
    
    return "\(minuteStamp) : \(secondStamp)"
}
