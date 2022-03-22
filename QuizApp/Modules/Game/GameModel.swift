//
//  GameModel.swift
//  QuizApp
//
//  Created by Brais Castro on 4/3/22.
//

import Foundation
import SwiftUI

struct Game {
    
    enum AnswerType {
        case correct
        case incorrect
        case timeout
    }
    
    struct ViewObject {
        var count: String
        var totalPoints: String
        var question: String
        var buttons: [ButtonAnswer]
        var timeLeft: String
        var countdownTrim: CGFloat
        var isAnswerDisabled: Bool
        
        init() {
            count = ""
            totalPoints = ""
            question = ""
            buttons = [
                ButtonAnswer(title: "", style: .primary),
                ButtonAnswer(title: "", style: .primary),
                ButtonAnswer(title: "", style: .primary)
            ]
            timeLeft = ""
            countdownTrim = 1
            isAnswerDisabled = false
        }
    }
    
    struct ButtonAnswer {
        var title: String
        var style: MainButtonType
    }
    
    struct QuestionsData: Codable {
        let questions: [QuestionData]
    }
    
    struct QuestionData: Codable {
        let id: Int
        let question: String
        let wrongAnswers: [String]
        let correctAnswer: String

        enum CodingKeys: String, CodingKey {
            case id, question
            case wrongAnswers = "wrong_answers"
            case correctAnswer = "correct_answer"
        }
    }

    struct Question {
        let question: String
        let answers: [String]
        let correct: String
    }
    
}
