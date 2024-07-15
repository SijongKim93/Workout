//
//  WorkoutType.swift
//  Workout
//
//  Created by 김시종 on 7/15/24.
//

import Foundation

struct WorkoutType: Identifiable {
    let id = UUID()
    let name: String
}

let workoutTypes: [WorkoutType] = [
    WorkoutType(name: "런닝"),
    WorkoutType(name: "수영"),
    WorkoutType(name: "웨이트 트레이닝"),
    WorkoutType(name: "사이클"),
    WorkoutType(name: "요가"),
    WorkoutType(name: "필라테스")
]
