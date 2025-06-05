//
//  HabitListView.swift
//  habit-tracker
//
//  Created by Liv Motley on 05/06/2025.
//

import SwiftUI

struct HabitListView: View {
    
    @StateObject var viewModel = HabitListViewModel()
    @State var showAddHabitForm: Bool = false
    @State var isEditMode: Bool = false
    
    var body: some View {
        ScrollView {
            
            VStack (alignment: .leading, spacing: 30) {
                Text("A good day starts the moment you want it to.")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top)
                
                VStack (alignment: .leading, spacing: 8){
                    Text(viewModel.dateString)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.pink)
                    
                    Text("🔥 1 day streak")
                        .font(.title3)
                }
                
                LazyVStack (spacing: 20) {
                    ForEach(viewModel.habits) { habit in
                        HabitButtonView(
                            habit: habit,
                            isEditMode: $isEditMode)
                    }
                }
                
                
                HStack {
                    Spacer()
                    
                    Button(
                        action: {
                            showAddHabitForm.toggle()
                        },
                        label: {
                            Image(systemName: "plus.circle.fill")
                                .font(Font.system(size: 50))
                                .foregroundStyle(.pink)
                        })
                    
                }
                
                Spacer()
            }}
        .padding()
        .sheet(isPresented: $showAddHabitForm, onDismiss: {
            viewModel.onAddHabitDismissed()
        }) {
            AddHabitView()
                .presentationDragIndicator(.visible)
        }
        
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(isEditMode ? "Done" : "Edit") {
                    isEditMode.toggle()
                    viewModel.refreshHabits()
                }
            }
        }
    }
}

#Preview {
    HabitListView()
}
