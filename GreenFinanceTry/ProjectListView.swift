//
//  ProjectListView.swift
//  GreenFinanceTry
//
//  Created by yoko on 20/03/2021.
//

import SwiftUI

struct ProjectListView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Project.entity(), sortDescriptors: [])
    var projects: FetchedResults<Project>

    @State private var showProjectSheet = false
    @State private var showingDetail = false
    
    func removeElement (at offsets: IndexSet) {
        for index in offsets {
            let projectList = projects[index]
            managedObjectContext.delete(projectList)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.projects){ element in
                    NavigationLink (
                        destination:
                            ProjectDetailView(elem: element),
                            //Text("detail of a project"),
                        label: {
                            HStack {
                                Text(element.title )
                            }
                            
                        })
                }
                .onDelete(perform: removeElement(at:))
            }
        .navigationTitle("Project list")
        .navigationBarItems(trailing: Button(action: {
                //print("Open profile sheet")
            self.showProjectSheet.toggle()
            }, label: {
                Image(systemName: "plus.circle")
                    .imageScale(.large)
            }))
            .sheet(isPresented: $showProjectSheet) {
                //Text("Profile sheet")
                ProjectSheet(isShown: self.$showProjectSheet).environment(\.managedObjectContext, self.managedObjectContext)
            }
        }

    }
}

struct ProjectListView_Previews: PreviewProvider {
    static var previews: some View {
    
        let persistenceController = PersistenceController.shared
        
        return
            ProjectListView().environment(\.managedObjectContext, persistenceController.container.viewContext)
    }
}
