//
//  AllProjectsView.swift
//  JK-Portfolio
//
//  Created by Janarthanan Kannan on 31/01/25.
//

import SwiftUI

struct AllProjectsView: View {

    @Environment(\.openURL) var openURL

    @State private var allProjects: [ProjectsModel] = []
    @State private var selectedCategory: String = "Mobile Apps"

    private let categories = ["Mobile Apps", "Github Repos", "Web Development"]

    var filteredProjects: [ProjectsModel] {
        allProjects.filter { $0.category == selectedCategory }
    }

    var body: some View {
        NavigationStack {

            VStack(spacing: 20) {

                // MARK: - CATEGORY TABS
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 30) {
                        ForEach(categories, id: \.self) { cat in
                            VStack {
                                Text(cat)
                                    .font(.headline)
                                    .foregroundColor(selectedCategory == cat ? .purple : .gray)
                                    .onTapGesture {
                                        withAnimation(.spring()) {
                                            selectedCategory = cat
                                        }
                                    }

                                Rectangle()
                                    .fill(selectedCategory == cat ? Color.purple : Color.clear)
                                    .frame(height: 3)
                                    .frame(maxWidth: selectedCategory == cat ? 80 : 0)
                                    .animation(.easeInOut, value: selectedCategory)
                            }
                        }
                    }
                    .padding(.horizontal)
                }

                // MARK: - PROJECT GRID
                ScrollView {
                    LazyVGrid(columns: [
                        GridItem(.flexible(), spacing: 10),
                        GridItem(.flexible(), spacing: 10)
                    ], spacing: 15) {

                        ForEach(filteredProjects.indices, id: \.self) { i in
                            ProjectCardView(index: filteredProjects[i]) {
                                let link = filteredProjects[i].link
                                if let url = URL(string: link) {
                                    openURL(url)
                                } else {
                                    print("Invalid URL:", link)
                                }
                            }
                        }
                    }
                    .padding()
                }

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
                allProjects = decoded
            } else {
                print("allprojects.json not found")
            }
        } catch {
            print("Failed to decode allprojects.json:", error)
        }
    }
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
