//
//  ContentView.swift
//  MultiplicationTables
//
//  Created by Dmitriy Eliseev on 26.06.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var game = GameViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                Form{
                    Section("Select Multiplication Table") {
                        Stepper(value: $game.gameIndex, in: 2...12) {
                            Text("\(game.gameIndex)").font(.headline)
                        }
                    }//Section 1
                    
                    Section("Number of Questions") {
                        Picker(selection: $game.selectQuestionCount, label: Text("")) {
                            ForEach(game.questionsCount, id: \.self) { index in
                                Text("\(index)").tag(index)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }//: Section 2
                    
                    Section(){
                        HStack(alignment: .center) {
                            Spacer()
                            Button("Start Game") {
                                print("start")
                                game.isShowingGameView.toggle()
                                game.generateQuestion()
                            }
                            .sheet(isPresented: $game.isShowingGameView, content: {
                                GameView(game: game)
                                    .presentationDragIndicator(.hidden)
                                    .presentationDetents([.medium, .large])
                            })
                            Spacer()
                        }
                    }//: Section 3
                }//: Form
                
            }//: VStack
            .navigationTitle("Multiplication Tables Game")
            .navigationBarTitleDisplayMode(.inline)
        }//: NavigationStack
    }
}


#Preview {
    ContentView()
}
