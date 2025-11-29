//
//  AllProjectsView.swift
//  JK-Portfolio
//
//  Created by Janarthanan Kannan on 31/01/25.
//

import SwiftUI

struct AllProjectsView: View {
    @Environment(\.openURL) var openURL

    @State private var appStorePrjects: [ProjectsModel] = []

    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: [GridItem(.flexible(), spacing: 5), GridItem(.flexible(), spacing: 5)], spacing: 10) {
                    ForEach(appStorePrjects.indices, id: \.self) { i in
                        ProjectCardView(index: appStorePrjects[i]) {
                            let link = appStorePrjects[i].link
                            if let url = URL(string: link) {
                                openURL(url)
                            } else {
                                print("Invalid URL: \(link)")
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("All Projects")
            .navigationBarTitleDisplayMode(.inline)
        }
        .task {
            await loadProjects()
        }
    }

    @MainActor
    private func loadProjects() async {
        do {
            if let url = Bundle.main.url(forResource: "allprojects", withExtension: "json") {
                let data = try Data(contentsOf: url)
                let decoded = try JSONDecoder().decode([ProjectsModel].self, from: data)
                appStorePrjects = decoded
            } else {
                print("allprojects.json not found in bundle")
            }
        } catch {
            print("Failed to load allprojects.json: \(error)")
        }
    }
}

#Preview {
    AllProjectsView()
}

struct ProjectCardView: View {
    let index: ProjectsModel
    var onTap: (() -> Void)? = nil

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
            .padding(10)
            .cornerRadius(10)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            onTap?()
        }
    }
}
