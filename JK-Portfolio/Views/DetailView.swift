//
//  DetailView.swift
//  JK-Portfolio
//
//  Created by Janarthanan Kannan on 31/12/24.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.presentationMode) var presentation
    @State private var showSkills: Bool = false
    @State private var showProjects: Bool = false
    @State var skillCards = [
        SkillsCardModel(name: "Swift", value: 88, icon: Image("Swift"), color: Color(hex: "D3533D")),
        SkillsCardModel(name: "SwiftUI", value: 70, icon: Image("SwiftUI"), color: Color(hex: "5692DF")),
        SkillsCardModel(name: "Objective-C", value: 80, icon: Image("Objective-C"), color: Color(hex: "365C9C")),
        SkillsCardModel(name: "Android Java", value: 75, icon: Image("Java"), color: Color(hex: "CB3134")),
        SkillsCardModel(name: "Kotlin", value: 50, icon: Image("Kotlin"), color: Color(hex: "843DF0")),
        SkillsCardModel(name: "HTML", value: 78, icon: Image("HTML5"), color: Color(hex: "D46430")),
        SkillsCardModel(name: "CSS", value: 80, icon: Image("CSS3"), color: Color(hex: "67A8DA")),
        SkillsCardModel(name: "WordPress & Shopify", value: 70, icon: Image("WordPress"), color: Color(hex: "4B4B4B"))
    ]
    @State var projectCards = [
        ProjectsModel(name: "CaddyTrack AI", image: "caddytrack", link: "https://apps.apple.com/us/app/caddytrack-ai/id6502741813"),
        ProjectsModel(name: "MYOJA", image: "myoja", link: "https://apps.apple.com/in/app/myoja/id6451094009"),
        ProjectsModel(name: "MyCitroën Connect", image: "citroen", link: "https://apps.apple.com/in/app/mycitroën-connect/id1613803195"),
        ProjectsModel(name: "BEEZER GOLF", image: "beezer", link: "https://apps.apple.com/us/app/beezer-golf-golf-scorecard/id1474924288"),
        ProjectsModel(name: "Store2K", image: "store2k", link: "https://www.store2k.com"),
        ProjectsModel(name: "Moonshine", image: "moonshine", link: "https://apps.apple.com/in/app/myoja/id6451094009"),
        ProjectsModel(name: "My Need Finder", image: "mnf", link: "https://apps.apple.com/in/app/myoja/id6451094009"),
        ProjectsModel(name: "Dhamani1969", image: "dhamani", link: "https://apps.apple.com/in/app/myoja/id6451094009"),
        ProjectsModel(name: "Cyber Gear", image: "cybergear", link: "https://apps.apple.com/in/app/myoja/id6451094009"),
        ProjectsModel(name: "Sahara Center", image: "sahara", link: "https://apps.apple.com/in/app/myoja/id6451094009"),
        ProjectsModel(name: "Canadian Specialist Hospital", image: "csh", link: "https://apps.apple.com/in/app/myoja/id6451094009"),
        ProjectsModel(name: "Dubai City Guide", image: "dcg", link: "https://apps.apple.com/in/app/myoja/id6451094009")
    ]
    var body: some View {
        NavigationStack {
            ScrollView {
                infoView
                skillsView
                projectsView
            }
            .navigationTitle("Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.presentation.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title)
                            .foregroundColor(.gray).opacity(0.4)
                    }
                }
            }
            .navigationDestination(isPresented: $showProjects) {
                AllProjectsView()
            }
        }
        .sheet(isPresented: $showSkills) {
            Expertise()
                .presentationDetents([.medium, .large])
        }
    }

    var skillsView: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Skills")
                        .modifier(Title())
                }
                Spacer()
                Text("View All")
                    .onTapGesture {
                        print("Skills View All Tapped...")
                        showSkills = true
                    }
            }
            .padding()
            Divider()
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 15) {
                    ForEach(skillCards, id: \.id) { card in
                        SkillsProgressView(model: card)
                            .frame(maxWidth: .infinity)
                    }
                }
                .padding()
            }
        }
    }

    var infoView: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Info")
                        .modifier(Title())
                    Divider()
                }
            }
            .padding()
            HStack {
                HStack {
                    LottieView(animationFileName: "experience", loopMode: .loop)
                                    .frame(width: 50, height: 50)
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Experience")
                            .font(.system(size: 15).bold())
                            .foregroundColor(.gray)
                        Text("10+")
                            .font(.system(size: 30).bold())
                    }
                }
                .padding()
                Divider()
                HStack {
                    LottieView(animationFileName: "projects", loopMode: .loop)
                                    .frame(width: 50, height: 50)
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Projects")
                            .font(.system(size: 15).bold())
                            .foregroundColor(.gray)
                        Text("75+")
                            .font(.system(size: 30).bold())
                    }
                }
                .padding()
            }
            Divider()
                .padding(.horizontal)
            HStack {
                HStack {
                    LottieView(animationFileName: "happy_clients", loopMode: .loop)
                                    .frame(width: 50, height: 50)
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Happy Clients")
                            .font(.system(size: 15).bold())
                            .foregroundColor(.gray)
                        Text("25+")
                            .font(.system(size: 30).bold())
                    }
                }
                .padding()
                Divider()
                HStack {
                    LottieView(animationFileName: "awards", loopMode: .loop)
                                    .frame(width: 50, height: 50)
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Awards")
                            .font(.system(size: 15).bold())
                            .foregroundColor(.gray)
                        Text("100+")
                            .font(.system(size: 30).bold())
                    }
                }
                .padding()
            }

        }
        .padding(.bottom, 20)
    }

    var projectsView: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Projects")
                        .modifier(Title())
                }
                Spacer()
                Text("View All")
                    .onTapGesture {
                        print("Projects View All Tapped...")
                        showProjects = true
                    }
            }
            .padding()
            Divider()
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 10) {
                    ForEach(projectCards, id: \.id) { card in
                        ProjectsItemView(model: card)
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    DetailView()
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Cochin", size: 35).bold())
    }
}

struct ProjectsItemView: View {
    var model: ProjectsModel
    var body: some View {
        VStack(alignment: .leading) {
            Image(model.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 195, height: 150)
                .cornerRadius(20)
            Text(model.name)
                .font(.system(size: 18).bold())
        }
    }
}
