//
//  DeveloperPreview.swift
//  habit-tracker
//
//  Created by Liv Motley on 05/06/2025.
//

import Foundation


class DeveloperPreview {
    // MARK: - HABITS
    static var habits: [Habit] = [
        .init(
            id: NSUUID().uuidString,
            emoji: "🧘‍♀️",
            title: "Gratitudes",
            description: "Write 3 gratitudes",
            streak: 0
        ),
        .init(
            id: NSUUID().uuidString,
            emoji: "📓",
            title: "Read",
            description: "Read 10 pages a day",
            streak: 0
        ),
        .init(
            id: NSUUID().uuidString,
            emoji: "💊",
            title: "Vitamins",
            description: "Take vitamins every morning!",
            streak: 0
        ),
    ]
}
