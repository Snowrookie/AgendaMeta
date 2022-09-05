//
//  ContentView.swift
//  Agenda Swift
//
//  Created by Antonio Carlos Dourado on 31/08/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
 
    @Environment(\.managedObjectContext) var context
    
    @FetchRequest(fetchRequest: Item.getAllItem()) var items: FetchedResults<Item>
    
    @State var text: String = ""
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("New item")) {
                    HStack {
                        TextField("Enter new item...", text: $text)
                        
                        Button(action: {
                            
                            if !text.isEmpty {
                                
                                let newItem = Item(context: context)
                                newItem.name = text
                                newItem.timestamp = Date()
                                
                                do {
                                    try context.save()
                                }
                                catch {
                                    print(error)
                                }
                                
                                text = ""
                            }
                                
                        }, label: {
                            Text("Save")
                        })
                            
                    }
                }
                
                Section {
                    ForEach(items) {Item in
                        VStack(alignment: .leading) {
                            Text(Item.name!)
                                .font(.headline)
                            Text("\(Item.timestamp!)")
                        }
                    }.onDelete(perform: { IndexSet in
                        guard let index = IndexSet.first else {
                            return
                        }
                        let itemToDelete = items[index]
                        context.delete(itemToDelete)
                        do {
                            try context.save()
                        }
                        catch {
                            print(error)
                        }
                    })
                }
            }
            .navigationTitle("Agenda Meta")
        }
    }
}
/**/
