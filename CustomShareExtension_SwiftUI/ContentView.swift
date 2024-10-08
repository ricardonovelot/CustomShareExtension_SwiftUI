//
//  ContentView.swift
//  CustomShareExtension_SwiftUI
//
//  Created by Ricardo on 07/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var savedText: String = ""

    var body: some View {
        VStack {
            if savedText.isEmpty {
                Text("No text saved yet.")
            } else {
                Text("Saved text: \(savedText)")
                    .padding()
            }
            Button("Load Text"){
                loadSavedText()
            }
        }
        .onAppear {
            loadSavedText()  // Automatically load text when the view appears
        }
    }
    
    // Retrieve saved text from UserDefaults
    func loadSavedText() {
        savedText = UserDefaults(suiteName: "group.com.example.MyApp.share")?.string(forKey: "sharedText") ?? ""
    }
}

#Preview {
    ContentView()
}



/*
 Resources
 
 https://medium.com/@henribredtprivat/create-an-ios-share-extension-with-custom-ui-in-swift-and-swiftui-2023-6cf069dc1209
 
 */
