//
//  ContentView.swift
//  Bookworm
//
//  Created by Jenn Park on 2023-07-06.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [ SortDescriptor(\.title) ]) var books: FetchedResults<Book>
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(books) { book in
                    NavigationLink {
                        DetailView(book: book)
                    } label: {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading) {
                                if book.rating < 2 {
                                    Text(book.title ?? "Unknown Title")
                                        .font(.headline)
                                        .foregroundColor(.red)
                                } else {
                                    Text(book.title ?? "Unknown Title")
                                        .font(.headline)
                                }
                                
                                Text(book.author ?? "Unknown Author")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteBooks)
            }
            .navigationTitle("Bookworm")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddScreen.toggle()
                    } label: {
                        Label("Add book", systemImage: "plus")
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddBookView()
            }
        }
    }
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            moc.delete(book)
            try? moc.save()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    struct WrappedView: View {
        @StateObject private var dataController = DataController()

        var body: some View {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
    
    static var previews: some View {
        WrappedView()
    }
}
