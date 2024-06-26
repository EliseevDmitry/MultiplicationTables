//
//  GameViewModel.swift
//  MultiplicationTables
//
//  Created by Dmitriy Eliseev on 26.06.2024.
//

import Foundation

@Observable
class GameViewModel {
    var gameIndex = 2
    var questionsCount = [5, 10, 15]
    var selectQuestionCount = 5
    var isShowingGameView = false
    var answer = ""
    var score = 0
    var valueOne: Int = 0
    var valueTwo: Int = 0
    var counterQuestions = 0
    var winAlert = false
    
    func generateQuestion() {
        valueOne = Int.random(in: 2...gameIndex)
        valueTwo = Int.random(in: 1...10)
    }
    
    func answerQuestion(){
        if Int(answer) == (valueOne * valueTwo) {
            score += 1
        }
        counterQuestions += 1
        if counterQuestions == selectQuestionCount {
            winAlert.toggle()
            return
        } else {
            answer = ""
            generateQuestion()
        }
    }
    
    func clearData(){
        score = 0
        winAlert = false
        valueOne = 0
        valueTwo = 0
        selectQuestionCount = 5
        counterQuestions = 0
        answer = ""
    }  
    
    var emptyFields: Bool {
        if checkString(text: answer) {
            return true
        }
        return false
    }
    
   private func checkString(text: String) -> Bool {
        for chr in text {
            guard let _ = chr.wholeNumberValue else {return false}
            }
        return true
    }
}
