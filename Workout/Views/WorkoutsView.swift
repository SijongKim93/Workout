//
//  ContentView.swift
//  Workout
//
//  Created by 김시종 on 7/4/24.
//

import SwiftUI

struct WorkoutsView: View {
    @ObservedObject var viewModel = WorkoutViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.workouts) { workout in
                HStack {
                    VStack(alignment: .leading) {
                        Text(workout.name)
                            .font(.headline)
                        Text("\(formatDuration(workout.duration)) - \(workout.caloriesBurned) kcal")
                    }
                    Spacer()
                    Image(systemName: "checkmark.seal.fill")
                }
            }
            .navigationTitle("Workouts")
            .onAppear {
                viewModel.loadWorkouts.onNext(())
            }
            .alert(item: $viewModel.errorMessage) { message in
                Alert(title: Text("Error"), message: Text(message), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    private func formatDuration(_ duration: TimeInterval) -> String {
        let hours = Int(duration) / 3600
        let minutes = (Int(duration) % 3600) / 60
        return String(format: "%02d:%02d", hours, minutes)
    }
}

extension String: Identifiable {
    public var id: String { self }
}

#Preview {
    WorkoutsView()
}
