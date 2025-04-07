//
//  ResumeView.swift
//  JK-Portfolio
//
//  Created by Janarthanan Kannan on 01/01/25.
//

import Foundation
import SwiftUI

struct ResumeView: View {

    let webView = WebView()
    @Environment(\.presentationMode) var presentation
    @State var urlString = Constants.resumeURL
    
    var body: some View {
        VStack {
            HStack {
                Text("Janarthanan's Resume")
                    .font(.system(size: 18).bold())
                Spacer()
                Button(action: {
                    self.presentation.wrappedValue.dismiss()
                }){
                    Image(systemName: "xmark.circle.fill")
                        .font(.title)
                        .foregroundColor(.gray).opacity(0.4)
                }

            }
            .padding([.leading, .trailing], 15)
            webView
        }
        .onAppear(){
            webView.loadURL(urlString: urlString)
        }
    }
}

