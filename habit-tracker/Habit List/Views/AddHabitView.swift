//
//  AddHabitView.swift
//  habit-tracker
//
//  Created by Liv Motley on 05/06/2025.
//

import SwiftUI

struct AddHabitView: View {
    
    @StateObject var viewModel = AddHabitViewModel()
    @Environment(\.presentationMode) var presentationMode
       
    
    var body: some View {
        VStack (alignment: .center, spacing: 25) {
            TextField("⭐️", text: $viewModel.emoji.max(1))
                .frame(width: 60)
                .font(.system(size: 60))
                .padding(.top, 30)
            
            TextField("Title", text: $viewModel.title.max(25))
                .font(.title)
                .fontWeight(.bold)
            
            TextField("Description", text: $viewModel.description.max(70), axis: .vertical)
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
            
            if(viewModel.error.count > 0) {
                Text(viewModel.error)
                    .foregroundStyle(.red)
            }
           
            
            Button(
                action: {
                    if(viewModel.addNewHabit()) {
                        presentationMode.wrappedValue.dismiss()
                    }
                },
                label: {
                    Text("Add Habit")
                        .foregroundStyle(.black)
                        .padding()
                        .background(.secondary)
                        .fontWeight(.semibold)
                        .cornerRadius(10)
            })
            
            Spacer()
        }
        .padding()
    }
}

extension Binding where Value == String {
    func max(_ limit: Int) -> Self {
        if self.wrappedValue.count > limit {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.prefix(limit))
            }
        }
        return self
    }
}

#Preview {
    AddHabitView()
}
