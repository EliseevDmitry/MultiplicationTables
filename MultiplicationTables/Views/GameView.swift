//
//  GameView.swift
//  MultiplicationTables
//
//  Created by Dmitriy Eliseev on 26.06.2024.
//

import SwiftUI

struct GameView: View {
    @Bindable var game: GameViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            VStack{
                Form{
                    Section("Ответь на вопрос?"){
                        HStack{
                            Spacer()
                            Text("\(game.valueOne) x \(game.valueTwo) = ?")
                                .font(.headline)
                            Spacer()
                        }
                    }//: Section 1
                    
                    Section("введите свой ответ:"){
                        TextField("Ответ на вопрос", text: $game.answer)
                            .keyboardType(.decimalPad)
                        
                    }//: Section 2
                    
                    Section(){
                        HStack(alignment: .center) {
                            Spacer()
                            Button("Дать ответ") {
                                game.answerQuestion()
                            }
                            .disabled(game.emptyFields == false || game.answer.isEmpty)
                            .alert("Игра закончена. Угадано \(game.score) из \(game.selectQuestionCount)", isPresented: $game.winAlert){
                                Button("Ok"){
                                    game.clearData()
                                    dismiss()
                                }
                            }
                            Spacer()
                        }
                    }//Section 3
                    Section("Правильные ответы:"){
                        HStack(alignment: .center) {
                            Spacer()
                            Text("Correct - \(game.score) is \(game.selectQuestionCount)")
                                .font(.title)
                            Spacer()
                        }
                    }//Section 4
                    
                }//: Form
            }//: VStack
            .navigationTitle("Ответы на вопросы:")
            .navigationBarTitleDisplayMode(.inline)
        }//: NavigationStack
    }
}

#Preview {
    GameView(game: GameViewModel())
}
