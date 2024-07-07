//
//  MainView.swift
//  Workout
//
//  Created by 김시종 on 7/7/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            WorkoutsView()
                .tabItem {
                    Label("운동 기록", systemImage: "dumbbell")
                }
            TimerView()
                .tabItem {
                    Label("타이머", systemImage: "timer")
                }
            MyPageView()
                .tabItem {
                    Label("마이 페이지", systemImage: "person.crop.circle")
                }
        }
    }
}

#Preview {
    MainView()
}
