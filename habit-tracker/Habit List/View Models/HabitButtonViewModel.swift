//
//  HabitButtonViewModel.swift
//  habit-tracker
//
//  Created by Liv Motley on 05/06/2025.
//

import Foundation

class HabitButtonViewModel: ObservableObject {
    @Published var habit: Habit
    
    init(habit: Habit) {
        self.habit = habit
    }
    
    func buttonClicked() {
        habit.isDone.toggle()
        
        if (habit.isDone) {
            habit.streak += 1
        } else {
            habit.streak -= 1
        }
    }
}
