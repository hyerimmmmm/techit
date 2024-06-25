//
//  ContentView.swift
//  WordBrowser
//
//  Created by 김혜림 on 6/24/24.
//

import SwiftUI

struct SectionView: View {
    var title: String
    var words: [String]
    
    init(_ title: String, words: [String]) {
        self.title = title
        self.words = words
    }
    
    var body: some View {
        Section(title) {
            if words.isEmpty {
                Text("(No items match your filer criteria)")
            } else {
                ForEach(words, id: \.self) { word in
                    Text(word)
                }
            }
        }
    }
}

struct ContentView: View {
    @StateObject var viewModel = LibraryViewModel()
    @State var isAddNewMordDialongPresented = false
    
    var body: some View {
        List {
            SectionView("", words: [viewModel.randomWord])
            SectionView("Peter's Tips", words: viewModel.filteredTips)
            SectionView("My favorite", words: viewModel.filteredFavorites)
        }
        .searchable(text: $viewModel.searchText)
        .textInputAutocapitalization(.never)
        .navigationTitle("Library")
        .refreshable {
            await viewModel.refresh()
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button(action: { isAddNewMordDialongPresented.toggle() }) {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $isAddNewMordDialongPresented) {
            NavigationStack {
                AddWordView { word in
                    print(word)
                    viewModel.addFavorite(word)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
