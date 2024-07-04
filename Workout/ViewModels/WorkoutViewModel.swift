//
//  WorkoutViewModel.swift
//  Workout
//
//  Created by 김시종 on 7/4/24.
//

import Foundation
import RxSwift
import RxCocoa


class WorkoutViewModel: ObservableObject {
    let loadWorkouts = PublishSubject<Void>()
    
    @Published var workouts: [Workout] = []
    @Published var errorMessage: String?
    
    private let disposeBag = DisposeBag()
    
    init() {
    let dummyWorkouts = [
        Workout(name: "Running", date: Date(), duration: 3600, caloriesBurned: 300),
        Workout(name: "Swimming", date: Date(), duration: 1800, caloriesBurned: 250),
        Workout(name: "Cycling", date: Date(), duration: 5400, caloriesBurned: 500)
    ]
        
    loadWorkouts
            .map { dummyWorkouts }
            .subscribe(onNext: { [weak self] workouts in
                self?.workouts = workouts
            }, onError: { [weak self] error in
                self?.errorMessage = error.localizedDescription
            })
            .disposed(by: disposeBag)
    }
}
