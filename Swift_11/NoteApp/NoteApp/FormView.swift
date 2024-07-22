//
//  FormView.swift
//  NoteApp
//
//  Created by 김혜림 on 7/22/24.
//

import SwiftUI

struct FormView: View {
    @EnvironmentObject var viewModel: NoteViewModel
    @Environment(\.dismiss) var dismiss
    @State var titleText = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextEditor(text: $titleText)
                        .frame(minHeight: 200)
                }
                Section {
                    Button(action: {
                        viewModel.addData(title: titleText)
                        titleText = ""
                        dismiss()
                    }) {
                        Text("Save now")
                    }
                    .foregroundStyle(.yellow)
                    .disabled(titleText.isEmpty)
                }
            }
            .navigationTitle("Publish")
            .toolbar {
                ToolbarItemGroup(placement: .destructiveAction) {
                    Button("Cancle") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    FormView()
}
