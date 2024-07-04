//
//  Workout.swift
//  Workout
//
//  Created by 김시종 on 7/4/24.
//

import Foundation


struct Workout: Identifiable {
    var id = UUID()
    var name: String
    var date: Date
    var duration: TimeInterval
    var caloriesBurned: Double
}
