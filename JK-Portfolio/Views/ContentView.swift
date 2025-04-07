//
//  ContentView.swift
//  JK-Portfolio
//
//  Created by Janarthanan Kannan on 27/12/24.
//

import SwiftUI
import MessageUI
import WebKit

struct ContentView: View {
    let names = ["Hello World! I'm", "Janarthanan Kannan", "TECH LEAD", "MOBILE APPLICATION DEVELOPER", "FRONT-END DEVELOPER", "UI/UX DESIGNER"]
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    @State private var counter = 0
    @State private var showSocialIcons: Bool = false
    @State private var showResumeButton: Bool = false
    @State private var isAnimating = false
    @State private var showDetails: Bool = false
    @State var showWebView = false
    @Environment(\.openURL) var openURL

    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Image("profile-pic")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                        .clipShape(Circle())
                        .padding()
                    VStack(spacing: 15) {
                        ForEach(0...counter, id: \.self) { index in
                            TypewriterView(text:names[index])
                                .font(.custom("Cochin", size: index > 1 ? 18 : 33))
                                .bold()
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.bottom, 40)
                    if showSocialIcons {
                        HStack(spacing: 40) {
                            Image("linkedin")
                                .background(.white)
                                .clipShape(Circle())
                                .frame(width: 40)
                                .onTapGesture {
                                    openURL(URL(string: Constants.linkedInURL)!)
                                }
                            Image("github")
                                .background(.white)
                                .clipShape(Circle())
                                .onTapGesture {
                                    openURL(URL(string: Constants.githubURL)!)
                                }
                            Image(systemName: "envelope.fill")
                                .font(.system(size: 30))
                                .foregroundColor(.white)
                                .onTapGesture {
                                    if MFMailComposeViewController.canSendMail() {
                                        MailComposeViewController.shared.sendEmail()
                                    } else {
                                        openURL(URL(string: "mailto:tjana17@gmail.com?subject=This%20is%20the%20subject")!)
                                    }
                                }
                            Image(systemName: "link")
                                .font(.system(size: 30))
                                .foregroundColor(.white)
                                .onTapGesture {
                                    openURL(URL(string: Constants.portfolioURL)!)
                                }
                        }
                        .padding(.bottom, 15)
                    }
                    if showResumeButton {
                        Button {
                            self.showWebView = true
                        } label: {
                            Text("View Resume")
                                .font(.custom("Cochin", size: 25).bold())
                                .foregroundColor(.white)
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .padding()
                                .overlay(
                                    Rectangle()
                                        .stroke(.yellow, lineWidth: 3)
                                )
                                .padding([.leading, .trailing], 30)
                        }
                        .fullScreenCover(isPresented: $showWebView) {
                            ResumeView()
                        }
                    }
                }
                .padding()
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showDetails = true
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    .fullScreenCover(isPresented: $showDetails, content: DetailView.init)
                }
            }
        }
        .onReceive(timer) { _ in
            withAnimation {
                if counter < names.count - 1 {
                    counter = counter + 1
                } else {
                    timer.upstream.connect().cancel()
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 6.5) {
                withAnimation(.easeInOut(duration: 1.0)) {
                    showSocialIcons = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        withAnimation(.bouncy(duration: 1.0)) {
                            showResumeButton = true
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

import Lottie

struct LottieView: UIViewRepresentable {

    var animationFileName: String
    let loopMode: LottieLoopMode

    func updateUIView(_ uiView: UIViewType, context: Context) {

    }

    func makeUIView(context: Context) -> UIView { // -> Lottie.LottieAnimationView {
//        let animationView = LottieAnimationView(name: animationFileName)
//        animationView.loopMode = loopMode
//        animationView.play()
//        animationView.contentMode = .scaleAspectFit
//        return animationView
        let view = UIView(frame: .zero)
                let lottieAnimationView = LottieAnimationView(name: animationFileName)
                lottieAnimationView.contentMode = .scaleAspectFit
                lottieAnimationView.loopMode = .loop
                lottieAnimationView.play()
                lottieAnimationView.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(lottieAnimationView)
                NSLayoutConstraint.activate([
                    lottieAnimationView.widthAnchor.constraint(equalTo: view.widthAnchor),
                    lottieAnimationView.heightAnchor.constraint(equalTo: view.heightAnchor)
                ])
                return view
    }
}
