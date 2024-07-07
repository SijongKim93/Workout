//
//  TimerView.swift
//  Workout
//
//  Created by 김시종 on 7/7/24.
//

import SwiftUI

struct TimerView: View {
    @State private var timeRemaining = 60
    
    var body: some View {
        VStack {
            Text("Timer")
                .font(.largeTitle)
                .padding()
            
            Text("\(timeRemaining)")
                .font(.system(size: 72, weight: .bold, design: .rounded))
                .padding()
            
            Button(action: startTimer)
        }
    }
}

#Preview {
    TimerView()
}
