//
//  TimerViewModel.swift
//  Workout
//
//  Created by 김시종 on 7/7/24.
//

import Foundation
import SwiftUI
import Combine

class TimerViewModel: ObservableObject {
    @Published var timerSettings: TimerSettings?
    @Published var timeRemaining: Int = 0
    @Published var isTimerRunning: Bool = false
    @Published var showSettings: Bool = false
    
    private var cancellable: AnyCancellable?
    
    func startTimer() {
        guard let settings = timerSettings else { return }
        timeRemaining = settings.minutes * 60 + settings.seconds
        isTimerRunning = true
        startCountdown()
    }
    
    func stopTimer() {
        isTimerRunning = false
        cancellable?.cancel()
    }
    
    func startCountdown() {
        cancellable = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                if self.timeRemaining > 0 {
                    self.timeRemaining -= 1
                } else {
                    self.stopTimer()
                }
            }
    }
    
    func resetSettings() {
        timerSettings = nil
    }
    
    func formatTime() -> String {
        let minutes = timeRemaining / 60
        let seconds = timeRemaining % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
