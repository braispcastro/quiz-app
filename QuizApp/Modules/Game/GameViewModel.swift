//
//  GameViewModel.swift
//  QuizApp
//
//  Created by Brais Castro on 4/3/22.
//

import Foundation
import SwiftUI

protocol GameViewModelProtocol {
    func onAppear(_ presentation: Binding<PresentationMode>)
    func onDisappear()
    func surrenderTapped()
    func answerTapped(index: Int)
}

final class GameViewModel: ObservableObject {
    
    @Published var viewObject: Game.ViewObject!
    
    private var presentation: Binding<PresentationMode>!
    private var timer: Timer!
    private var timeLeft: Int!
    private var totalPoints: Int!
    private var questionsData: [Game.QuestionData]!
    private var questions: [Game.Question]!
    private var currentQuestionIndex: Int!
    
    private let router: GameRouter!
    
    init(router: GameRouter) {
        self.router = router
        prepareView()
    }
    
    private func prepareView() {
        viewObject = Game.ViewObject()
        getQuestions()
    }
    
    // MARK: - Private Methods
    
    private func stopTimer() {
        if timer != nil {
            timer.invalidate()
            timer = nil
        }
    }
    
    private func getQuestions() {
        guard let path = Bundle.main.path(forResource: "questions", ofType: "json") else {
            fatalError("Check questions.json file")
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let q = try JSONDecoder().decode(Game.QuestionsData.self, from: data)
            questionsData = q.questions
        } catch {
            fatalError("Check questions.json file")
        }
    }
    
    private func setupQuestions() {
        questions = []
        questionsData = questionsData.shuffled()
        questionsData.forEach { qd in
            var answers = qd.wrongAnswers
            answers.append(qd.correctAnswer)
            let question = Game.Question(question: qd.question,
                                         answers: answers.shuffled(),
                                         correct: qd.correctAnswer)
            questions.append(question)
        }
        startGame()
    }
    
    private func startGame() {
        totalPoints = 0
        viewObject.totalPoints = String(totalPoints)
        currentQuestionIndex = -1
        nextQuestion()
    }
    
    private func nextQuestion() {
        guard currentQuestionIndex < 9 else {
            // TODO: Game finished
            //RankingManager.shared.saveGameToRanking(name: "Brais", points: totalPoints)
            viewObject.showPrompt = true
            return
        }
        
        currentQuestionIndex += 1
        timeLeft = 30
        viewObject.timeLeft = String(timeLeft)
        viewObject.count = "\(currentQuestionIndex + 1)/\(questions.count)"
        let currentQuestion = questions[currentQuestionIndex]
        viewObject.question = currentQuestion.question
        viewObject.buttons[0].title = currentQuestion.answers[0]
        viewObject.buttons[0].style = .primary
        viewObject.buttons[1].title = currentQuestion.answers[1]
        viewObject.buttons[1].style = .primary
        viewObject.buttons[2].title = currentQuestion.answers[2]
        viewObject.buttons[2].style = .primary
        viewObject.isAnswerDisabled = false
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(questionTimer), userInfo: nil, repeats: true)
    }
    
    private func validateAnswer(_ type: Game.AnswerType) {
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(goToNextQuestionFromTimer), userInfo: nil, repeats: false)
    }
    
    @objc private func questionTimer() {
        timeLeft -= 1
        viewObject.timeLeft = String(timeLeft)
        
        if timeLeft < 1 {
            stopTimer()
            let currentQuestion = questions[currentQuestionIndex]
            let correctIndex = viewObject.buttons.firstIndex{ $0.title == currentQuestion.correct }!
            viewObject.buttons[correctIndex].style = .secondary
            validateAnswer(.timeout)
        }
    }
    
    @objc private func goToNextQuestionFromTimer() {
        stopTimer()
        nextQuestion()
    }
    
}

// MARK: - GameViewModelProtocol
extension GameViewModel: GameViewModelProtocol {
    
    func onAppear(_ presentation: Binding<PresentationMode>) {
        self.presentation = presentation
        viewObject.showPrompt = false
        setupQuestions()
    }
    
    func onDisappear() {
        stopTimer()
    }
    
    func surrenderTapped() {
        presentation.wrappedValue.dismiss()
    }
    
    func answerTapped(index: Int) {
        stopTimer()
        viewObject.isAnswerDisabled = true
        viewObject.buttons[index].style = .secondary
        let currentQuestion = questions[currentQuestionIndex]
        let correctIndex = viewObject.buttons.firstIndex{ $0.title == currentQuestion.correct }!
        viewObject.buttons[correctIndex].style = .correct
        let isCorrect = correctIndex == index
        if isCorrect {
            totalPoints = Int(viewObject.totalPoints) ?? 0
            viewObject.totalPoints = "\(totalPoints + timeLeft)"
        } else {
            viewObject.buttons[index].style = .incorrect
        }
        let validationType: Game.AnswerType = isCorrect ? .correct : .incorrect
        validateAnswer(validationType)
    }
    
}
