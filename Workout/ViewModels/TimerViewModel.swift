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
    
    
    
}
