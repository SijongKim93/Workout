//
//  TimerSettingsView.swift
//  Workout
//
//  Created by 김시종 on 7/7/24.
//

import Foundation
import SwiftUI


struct TimerSettingsView: View {
    @ObservedObject var viewModel: TimerViewModel
    @State private var minutes: Int = 0
    @State private var seconds: Int = 0
    
    var body: some View {
        VStack {
            Text("타이머 설정")
                .font(.largeTitle)
                .padding()
            
            HStack {
                Picker("Minutes", selection: $minutes) {
                    ForEach(0..<60) {
                        Text("\($0) 분")
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 100)
                .clipped()
                
                Picker("Seconds", selection: $seconds) {
                    ForEach(Array(stride(from: 0, through: 50, by: 10)), id: \.self) {
                        Text("\($0) 초")
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 100)
                .clipped()
            }
            .padding()
            
            Button(action: {
                viewModel.timerSettings = TimerSettings(minutes: minutes, seconds: seconds)
                viewModel.showSettings = false
            }) {
                Text("설정 저장")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

#Preview {
    TimerView()
}
