//
//  Expertise.swift
//  JK-Portfolio
//
//  Created by Janarthanan Kannan on 08/01/25.
//

import SwiftUI

struct Expertise: View {
    var skills: [String] = ["Project Management", "Teamwork", "Time Management", "Leadership", "Effective Communication", "Critical Thinking", "Individual Performer", "Tech & App Architect"]
    var techSkills: [String] = ["SwiftUI", "Swift", "UIKit", "Objective C", "Java & Kotlin", "Javascript", "HTML & CSS", "Android", "Google Analytics", "Firestore Storage", "Firebase Crashlytics", "MySQL","Sqlite", "Realm", "GitHub / Bit Bucket", "Design Principles", "Data Structures", "CoreData", "CocoaTouch & MLKit", "Unit Testing", "UI/UX", "Mapkit, Storyboard & XIB", "Memory Management", "App Optimization", "Push Notification(APNS)", "3rd Party Integrations"]
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section(header: Text("Skills")) {
                        ForEach(skills, id: \.self) { index in
                            Text(index)
                                .font(.system(size: 18).weight(.medium))
                                .padding(.vertical, 8)
                        }
                    }
                    Section(header: Text("Skills - Tech")) {
                        ForEach(techSkills, id: \.self) { index in
                            Text(index)
                                .font(.system(size: 18).weight(.medium))
                                .padding(.vertical, 8)
                        }
                    }
                }
            }
            .navigationTitle("Skills & Expertise")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    Expertise()
}
