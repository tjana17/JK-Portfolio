//
//  SkillsProgressView.swift
//  JK-Portfolio
//
//  Created by Janarthanan Kannan on 31/12/24.
//

import Foundation
import SwiftUI

struct SkillsProgressView: View {

    var duration: Double = 3.8
    let model: SkillsCardModel
    let timer = Timer.publish(every: 0.06, on: .main, in: .common).autoconnect()
    
    @State private var showProgress: Bool = false
    @State var progress: Double = 0.0

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                model.icon
                    .resizable()
                    .frame(width: 40, height: 40)
                Text(model.name)
                    .font(.system(size: 18).bold())
            }
            if showProgress {
                ProgressView("\(progress, specifier: "%.0f")%", value: Double(progress), total: 100)
                    .tint(model.color)
                    .animation(.easeInOut(duration: 1), value: Double(progress))
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                showProgress = true
            }
        }
        .onReceive(timer) { _ in
            if progress < model.value {
                progress += 1
            } else {
                timer.upstream.connect().cancel()
            }
        }
    }
}
