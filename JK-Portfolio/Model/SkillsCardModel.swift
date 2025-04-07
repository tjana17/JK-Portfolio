//
//  SkillsCardModel.swift
//  JK-Portfolio
//
//  Created by Janarthanan Kannan on 31/12/24.
//

import SwiftUI

struct SkillsCardModel {
    let id = UUID()
    let name: String
    let value: Double
    let icon: Image
    let color: Color
}

struct ProjectsModel {
    let id = UUID()
    let name: String
    let image: String
    let link: String
}
