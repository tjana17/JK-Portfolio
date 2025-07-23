//
//  AllProjectsView.swift
//  JK-Portfolio
//
//  Created by Janarthanan Kannan on 31/01/25.
//

import SwiftUI

struct AllProjectsView: View {
    @State var appStorePrjects = [
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
        ProjectsModel(name: "Dubai City Guide", image: "dcg", link: "https://apps.apple.com/in/app/myoja/id6451094009"),
        ProjectsModel(name: "Clinic Booking", image: "clinic_booking_web", link: "https://github.com/tjana17/ClinicBooking"),
        ProjectsModel(name: "News App", image: "news_app_web", link: "https://github.com/tjana17/News-App"),
        ProjectsModel(name: "Weather App", image: "weather_web", link: "https://github.com/tjana17/WeatherApp-SwiftUI"),
        ProjectsModel(name: "BMI Calculator", image: "bmi_calculator_web", link: "https://github.com/tjana17/BMI-Calculator"),
        ProjectsModel(name: "Novitas Health Care", image: "novitas_web", link: "https://github.com/tjana17/Novitas"),
        ProjectsModel(name: "Food Ordering App", image: "food_ordering_web", link: "https://github.com/tjana17/FoodOrdering"),
        ProjectsModel(name: "Reminders", image: "reminders_web", link: "https://github.com/tjana17/Reminders"),
        ProjectsModel(name: "Notes App", image: "notes_app_web", link: "https://github.com/tjana17/NotesApp"),
        ProjectsModel(name: "Firebase Authentication", image: "firebase_signin_web", link: "https://github.com/tjana17/FirebaseSignIn"),
        ProjectsModel(name: "Onboarding Screens", image: "onboarding_web", link: "https://github.com/tjana17/OnboardingScreens"),
        ProjectsModel(name: "Charts App", image: "charts_swiftui", link: "https://github.com/tjana17/Charts-SwiftUI")
    ]


    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: [GridItem(.flexible(), spacing: 5), GridItem(.flexible(), spacing: 5)], spacing: 10) {
                    ForEach(appStorePrjects, id: \.id) {index in
                        ProjectCardView(index: index)
                    }
                }
                .padding()
            }
            .navigationTitle("All Projects")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AllProjectsView()
}

struct ProjectCardView: View {
    let index: ProjectsModel
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Image(index.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                VStack {
                    Text("\(index.name)")
                        .font(.body)
                        .fontWeight(.bold)
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                }

            }
            //.frame(minWidth: 176, maxWidth: 176, minHeight: 176, maxHeight: 176)
            .padding(10)
//            .background(Color(red: 200/255, green: 200/255, blue: 230/255))
            .cornerRadius(10)
        }
    }
}
