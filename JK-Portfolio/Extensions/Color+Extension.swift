//
//  Color+Extension.swift
//  JK-Portfolio
//
//  Created by Janarthanan Kannan on 31/12/24.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: String) {
        var cleanHexCode = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0

        Scanner(string: cleanHexCode).scanHexInt64(&rgb)

        let redValue = Double((rgb >> 16) & 0xFF) / 255.0
        let greenValue = Double((rgb >> 8) & 0xFF) / 255.0
        let blueValue = Double(rgb & 0xFF) / 255.0
        self.init(red: redValue, green: greenValue, blue: blueValue)
    }

    public static var lightGray: Color {
        return Color.init(hex: Colors.lightGray.description)
    }
    public static var listBackgroundGray: Color {
        return Color.init(hex: Colors.listBackgroundGray.description)
    }
}

enum Colors: String, CustomStringConvertible {
    case lightGray = "#CDCDCD"
    case listBackgroundGray = "#F2F1F7"

    var description: String {
        return self.rawValue
    }
}
