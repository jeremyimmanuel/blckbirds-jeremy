//
//  TaskDone.swift
//  to-do-app
//
//  Created by Jeremy's Macbook Pro 16 on 6/27/20.
//  Copyright © 2020 Jeremy Tandjung. All rights reserved.
//

import SwiftUI

struct TaskDone: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(entity: ToDoItems.entity(),                     sortDescriptors: [NSSortDescriptor(keyPath:             \ToDoItems.createdAt, ascending: false)],                 predicate: NSPredicate(format: "taskDone = %d", true))
    var fetchedItems: FetchedResults<ToDoItems>
    
    var rowHeight: CGFloat = 50
    
    var body: some View {
        List {
            ForEach(fetchedItems, id: \.self) { item in
                HStack {
                    Text(item.taskTitle ?? "Empyt")
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                        .imageScale(.large)
                        .foregroundColor(.blue)
                }
                .frame(height: self.rowHeight)
            }
        }.navigationBarTitle(Text("Tasks done"))
        .listStyle(GroupedListStyle())
    }
}

struct TaskDone_Previews: PreviewProvider {
    static var previews: some View {
        TaskDone()
    }
}
