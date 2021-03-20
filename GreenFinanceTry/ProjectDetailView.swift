//
//  ProjectDetailView.swift
//  GreenFinanceTry
//
//  Created by vincent schmitt on 20/03/2021.
//

import SwiftUI

struct ProjectDetailView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @State private var editMode = false
    @State private var editTitle = ""
    @State private var editDescription_project = ""
    @State private var editBudget = ""
    @State private var editPicture = ""
    @State private var editVideo = ""
    @State private var editCreated_date = Date()
    @State private var editFinished_date = Date()
    @State private var editCategory = ""
    
    
    @ObservedObject var element: Project
    
    init(elem: Project) {
        self.element = elem
        self._editTitle = State(initialValue: elem.title )
        self._editDescription_project = State(initialValue: elem.description_project )
        self._editBudget = State(initialValue: elem.budget)
        self._editPicture = State(initialValue: elem.picture)
        self._editVideo = State(initialValue: elem.video!)
        self._editCreated_date = State(initialValue: elem.created_date)
        self._editFinished_date = State(initialValue: elem.finished_date)
        self._editCategory = State(initialValue: elem.category)
    }
 
    
    var body: some View {
        NavigationView {
        VStack {
            if editMode {

                TextField(element.title, text: $editTitle)
                    .padding(.bottom)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            
                TextField(element.description_project, text: $editDescription_project)
                    .padding(.bottom)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                //TextField(String(element.budget), value: $editBudget, formatter: NumberFormatter())
                TextField(String(element.budget), text: $editBudget)                    .padding(.bottom)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField(element.picture, text: $editPicture)
                    .padding(.bottom)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField(element.video!, text: $editVideo)
                    .padding(.bottom)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                DatePicker(selection: $editCreated_date, in: ...Date(), displayedComponents: .date) {
                                Text("Created date")
                            }
                
                DatePicker(selection: $editFinished_date, in: ...Date(), displayedComponents: .date) {
                                Text("Finished date")
                            }
                
                TextField(element.category, text: $editCategory)
                    .padding(.bottom)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            } else {
                Text(element.title)
                Text(element.description_project)
                Text(element.budget)
                Text(element.picture)
                Text(element.video ?? "")
                Text(element.created_date.addingTimeInterval(600), style: .date)
                Text(element.finished_date.addingTimeInterval(600), style: .date)
                Text(element.category)
            }
            Spacer()
            HStack {
                if editMode {
                    Button(action: {
                        let elem = self.element
                        self.element.title = self.editTitle
                        self.element.description_project = self.editDescription_project
                        self.element.budget = self.editBudget
                        self.element.picture = self.editPicture
                        self.element.video = self.editVideo
                        self.element.created_date = self.editCreated_date
                        self.element.finished_date = self.editFinished_date
                        self.element.category = self.editCategory
                        self.editMode.toggle()
                    }, label: {
                        Text("Validate")
                    })
                } else {
                    Button(action: {
                        self.editMode.toggle()
                    }, label: {
                        Text("Modify")
                    })
                }
            }

        }
        .navigationTitle("Project:  \(element.title)")
        }

    }
}

struct ProjectDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let persistenceController = PersistenceController.shared
        let context = persistenceController.container.viewContext
        let prj = Project(context: context)
        prj.id = UUID()
        prj.title = ""
        prj.description_project = ""
        prj.budget = ""
        prj.picture = ""
        prj.video = ""
        prj.created_date = Date()
        prj.finished_date = Date()
        prj.category = ""
        
        return
            ProjectDetailView(elem: prj).environment(\.managedObjectContext, context)
    }
}
