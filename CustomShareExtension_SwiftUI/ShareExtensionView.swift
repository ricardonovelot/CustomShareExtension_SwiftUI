//
//  ShareExtensionView.swift
//  MainShareAction
//
//  Created by Ricardo on 07/10/24.
//

import SwiftUI

struct ShareExtensionView: View {
    @State private var text: String
    
    init(text: String) {
        self.text = text
    }
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 20){
                TextField("Text", text: $text, axis: .vertical)
                    .lineLimit(3...6)
                    .textFieldStyle(.roundedBorder)
                
                Button {
                    saveText()
                    close()
                } label: {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Share Extension")
            .toolbar {
                Button("Cancel") {
                    close()
                }
            }
        }
    }
    
    //  Close the Share Extension from SwiftUI
    func close() {
            NotificationCenter.default.post(name: NSNotification.Name("close"), object: nil)
        }
    
    
    // Save text using UserDefaults
    func saveText() {
        UserDefaults(suiteName: "group.com.example.MyApp.share")?.set(text, forKey: "sharedText")
    }
    
    // Retrieve saved text
    static func loadText() -> String {
        return UserDefaults(suiteName: "group.com.example.MyApp.share")?.string(forKey: "sharedText") ?? ""
    }
}

#Preview {
    ShareExtensionView(text: "Think big!")
}
