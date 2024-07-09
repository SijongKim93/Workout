//
//  TimerView.swift
//  Workout
//
//  Created by 김시종 on 7/7/24.
//

import SwiftUI

struct TimerView: View {
    @ObservedObject var viewModel = TimerViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.timerSettings != nil {
                    Text(viewModel.formatTime())
                        .font(.system(size: 75, weight: .bold, design: .rounded))
                        .padding()
                    
                    Button(action: viewModel.isTimerRunning ? viewModel.stopTimer : viewModel.startTimer) {
                        Text(viewModel.isTimerRunning ? "Stop Timer" : "Start Timer")
                            .font(.title)
                            .padding()
                            .background(viewModel.isTimerRunning ? Color.red : Color.indigo)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                } else {
                    Text("타이머를 설정하시겠어요?")
                        .font(.title)
                        .padding()
                    Button(action: {
                        viewModel.showSettings = true
                    }) {
                        Text("타이머 설정")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .padding()
                            .background(Color.indigo)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
            .navigationTitle("Timer")
            .navigationBarItems(trailing: settingsButton)
            .sheet(isPresented: $viewModel.showSettings) {
                TimerSettingsView(viewModel: viewModel)
            }
            .onAppear {
                if let timerSettings = viewModel.timerSettings {
                    viewModel.timeRemaining = timerSettings.minutes * 60 + timerSettings.seconds
                }
            }
        }
    }
    
    var settingsButton: some View {
        Button(action: {
            viewModel.showSettings = true
        }) {
            Text("설정 변경")
        }
        .disabled(viewModel.timerSettings == nil)
    }
}

#Preview {
    TimerView()
}
