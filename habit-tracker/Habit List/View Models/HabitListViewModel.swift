//
//  HabitListViewModel.swift
//  habit-tracker
//
//  Created by Liv Motley on 05/06/2025.
//

import Foundation

class HabitListViewModel: ObservableObject {
    @Published var habits = [Habit]()
    
    init() {
        habits = DeveloperPreview.habits
    }
}
