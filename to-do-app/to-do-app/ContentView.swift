//
//  ContentView.swift
//  to-do-app
//
//  Created by Jeremy's Macbook Pro 16 on 6/27/20.
//  Copyright © 2020 Jeremy Tandjung. All rights reserved.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var sampleTasks = [
        "Task One", "Task Two", "Task Three"
    ]
    
    var rowHeight: CGFloat = 50
    
    @State private var newTaskTitle = ""
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(entity: ToDoItems.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \ToDoItems.createdAt, ascending: false)], predicate: NSPredicate(format: "taskDone = %d", false)) // filter
    
    var fetchedItems: FetchedResults<ToDoItems>
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(fetchedItems, id: \.self) { item in
                    HStack {
                        Text(item.taskTitle ??
                        "Empty")
                        Spacer()
                        
                        Button(action: {self.markTaskDone(at: self.fetchedItems.firstIndex(of: item)!)}) {
                            Image(systemName: "circle")
                                .imageScale(.large)
                                .foregroundColor(.gray)
                        }
                    }.frame(height: self.rowHeight)
                }
                .onDelete(perform: removeItems)
                
                
                HStack {
                    TextField("Add task...", text: $newTaskTitle, onCommit: self.saveTask)
                    Button(action: self.saveTask) {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }
                }.frame(height: rowHeight)
                
                NavigationLink(destination: TaskDone()) {
                    Text("Task Done")
                        .frame(height: rowHeight)
                }
            }
            .navigationBarTitle(Text("To-Do"))
            .navigationBarItems(trailing: EditButton())
            .listStyle(GroupedListStyle())
            
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        for index in offsets {
            let item = fetchedItems[index]
            managedObjectContext.delete(item)
        }
        
        do {
            try self.managedObjectContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func saveTask() {
        guard self.newTaskTitle != "" else {
            return
        }
        
        let newToDoItem = ToDoItems(context: self.managedObjectContext)
        newToDoItem.taskTitle = self.newTaskTitle
        newToDoItem.createdAt = Date()
        newToDoItem.taskDone = false
        
        // saving to CoreData
        do {
            try self.managedObjectContext.save()
        } catch {
            print(error.localizedDescription)
        }
        
        // Reset add task field
        self.newTaskTitle = ""
    }
    
    func markTaskDone(at index: Int) {
        let item = self.fetchedItems[index]
        item.taskDone = true
        do {
            try self.managedObjectContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        return ContentView().environment(\.managedObjectContext, context)
    }
}
