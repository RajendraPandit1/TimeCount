//
//  Backend Code.swift
//  TimeCount
//
//  Created by rajendra pandit on 22/07/2023.
//

import Foundation
import Combine
import SwiftUI


class BackgroundTaskManager: ObservableObject {
    static let shared = BackgroundTaskManager()
    
    private var timer: Timer?
    private var startDate: Date?
    
    @AppStorage("dayc") var dayCount = 0
    @AppStorage("daym") var daymax = 0
    @AppStorage("hourc") var hourCount = 0
    @AppStorage("minutec") var minuteCount = 0
    @AppStorage("secondc") var secondCount = 0
    @AppStorage("best")  var best:Int = 0
    @AppStorage("gaveup") var gaveUp:Int = 0
    
    private init() {}
    
    
    
    func start() {
        startDate = Date()
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    func stop() {
        timer?.invalidate()
        dayCount = 0
        hourCount = 0
        minuteCount = 0
        secondCount = 0
        gaveUp = gaveUp+1
    }
    
    @objc private func updateTime() {
        guard let startDate = startDate else { return }
        let currentDate = Date()
        
        do{
            if dayCount > daymax {
                daymax = dayCount
            }
        }
        
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.day, .hour, .minute, .second], from: startDate, to: currentDate)
        
        dayCount = dateComponents.day ?? 0
        hourCount = dateComponents.hour ?? 0
        minuteCount = dateComponents.minute ?? 0
        secondCount = dateComponents.second ?? 0
        
        
    }
    
    
}
