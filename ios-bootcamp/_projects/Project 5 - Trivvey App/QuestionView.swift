//
//  QuestionView.swift
//  appteam
//
//  Created by aakesh y on 10/21/25.
//

import SwiftUI

struct QuestionView: View {
    @State private var decodedQuestions: [Question] = []
    // store questions
    struct Question: Codable {
        let question: String
        let A: String
        let B: String
        let C: String
        let D: String
        let answer: String
    }
    
    var body: some View {
        NavigationStack {
            List(decodedQuestions, id: \.question) { q in
                // Add NavigationLink to QuestionView for each question
                NavigationLink(q.question) {
                    QuestionDetailView(question: q)
                }
            }
            // Add navigationTitle
            .navigationTitle("Trivvey")
            
            // Add shuffle button in toolbar
            .toolbar {
                ToolbarItem() {
                    Button {
                        decodedQuestions.shuffle()
                    } label: {
                        Image(systemName: "shuffle")
                    }
                    .padding()
                }
            }
        }
        .onAppear {
            let url: URL = Bundle.main.url(forResource: "questions", withExtension: "json")!
            let data = try! Data(contentsOf: url)
            // decode the questions
            decodedQuestions = try! JSONDecoder().decode([Question].self, from: data)
        }
    }
}

struct QuestionDetailView: View {
    let question: QuestionView.Question
    @State private var answerCheck: String = ""
    @State private var answerColor: Color = .black
    var body: some View {
        VStack {
            Spacer()
            Text(question.question)
                .padding()
            Spacer()
            
            let choices = ["A", "B", "C", "D"]
            let choiceValues: [String] = [question.A, question.B, question.C, question.D]
            
            ForEach (0..<choices.count, id: \.self) { choice in
                VStack {
                    Button {
                        if (choices[choice] == question.answer) {
                            answerCheck = "Correct!"
                            answerColor = .green
                        }
                        else {
                            answerCheck = "Try Again!"
                            answerColor = .red
                        }
                    } label: {
                        Text(choiceValues[choice])
                    }
                    .padding()
                    .background(Color.secondary.opacity(0.15), in: RoundedRectangle(cornerRadius: 16))
                    //.border(Color.blue)
                }
            }
            
            Spacer()
            Text(answerCheck)
                .foregroundColor(answerColor)
                .bold()
                .padding()
            Spacer()
        }
    }
}

#Preview {
    QuestionView()
}
