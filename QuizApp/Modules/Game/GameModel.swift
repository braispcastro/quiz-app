//
//  GameModel.swift
//  QuizApp
//
//  Created by Brais Castro on 4/3/22.
//

import Foundation

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
        var firstAnswer: String
        var secondAnswer: String
        var thirdAnswer: String
        var surrender: String
        var timeLeft: String
        
        init() {
            count = ""
            totalPoints = ""
            question = ""
            firstAnswer = ""
            secondAnswer = ""
            thirdAnswer = ""
            surrender = ""
            timeLeft = ""
        }
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
