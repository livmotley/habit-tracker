//
//  AddHabitViewModel.swift
//  habit-tracker
//
//  Created by Liv Motley on 05/06/2025.
//

import Foundation

class AddHabitViewModel: ObservableObject {
    @Published var emoji: String = ""
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var error: String = ""
    
    func addNewHabit() -> Bool {
        if(emoji.count > 0 && title.count > 1 && description.count > 1) {
            error = ""
            DeveloperPreview.habits.append(Habit(
                id: UUID().uuidString,
                emoji: emoji,
                title: title,
                description: description,
                streak: 0
            ))
            eraseDataField()
        } else {
            error = "Please make sure all fields are complete."
            return false
        }
        
        return true
    }
    
    func eraseDataField() {
        emoji = ""
        title = ""
        description = ""
    }
}
