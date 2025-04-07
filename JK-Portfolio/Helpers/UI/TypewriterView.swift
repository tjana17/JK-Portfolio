//
//  TypewriterView.swift
//  JK-Portfolio
//
//  Created by Janarthanan Kannan on 27/12/24.
//

import SwiftUI

struct TypewriterView: View {
    var text: String
    var typingDelay: Duration = .milliseconds(60)

    @State private var animatedText: AttributedString = ""
    @State private var typingTask: Task<Void, Error>?

    var body: some View {
        Text(animatedText)
            .onChange(of: text) { _, _ in animateText() }
            .onAppear() { animateText() }
    }

    private func animateText() {
        typingTask?.cancel()

        typingTask = Task {
            let defaultAttributes = AttributeContainer()
            animatedText = AttributedString(text,
                                            attributes: defaultAttributes.foregroundColor(.clear)
            )

            var index = animatedText.startIndex
            while index < animatedText.endIndex {
                try Task.checkCancellation()

                // Update the style
                animatedText[animatedText.startIndex...index]
                    .setAttributes(defaultAttributes)

                // Wait
                try await Task.sleep(for: typingDelay)

                // Advance the index, character by character
                index = animatedText.index(afterCharacter: index)
            }
        }
    }
}
