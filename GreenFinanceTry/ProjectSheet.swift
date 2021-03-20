//
//  ProjectSheet.swift
//  GreenFinanceTry
//
//  Created by vincent schmitt on 20/03/2021.
//

import SwiftUI

struct ProjectSheet: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State var myTitle = ""
    @State var myDescription_project = ""
    @State var myBudget = ""
    @State var myPicture = ""
    @State var myVideo = ""
    @State var myCreated_date = Date()
    @State var myFinished_date = Date()
    @State var myCategory = ""
    
    @Binding var isShown: Bool
    
    var body: some View {
        VStack {
        Form {
            Section(header: Text("Title")) {
                TextField("", text: $myTitle)
            }
            Section(header: Text("Description")) {
                TextField("", text: $myDescription_project)
            }
            Section(header: Text("Budget")) {
                //TextField("", value: $myBudget, formatter: NumberFormatter())
                TextField("", text: $myBudget)
            }
            Section(header: Text("Picture")) {
                TextField("", text: $myPicture)
            }
            Section(header: Text("Video")) {
                TextField("", text: $myVideo)
            }
            Section(header: Text("Created date")) {
                DatePicker(selection: $myCreated_date, in: ...Date(), displayedComponents: .date) {
                                Text("Created date")
                            }
            }
            Section(header: Text("Finished date")) {
                DatePicker(selection: $myFinished_date, in: ...Date(), displayedComponents: .date) {
                                Text("Finished date")
                            }
            }
            Section(header: Text("Category")) {
                TextField("", text: $myCategory)
            }

        }
        Spacer()
        Button(action: {
            let newProject = Project(context: self.managedObjectContext)
            newProject.id = UUID()
            newProject.title = myTitle
            newProject.description_project = myDescription_project
            newProject.budget = myBudget
            newProject.picture = myPicture
            newProject.video = myVideo
            newProject.created_date = myCreated_date
            newProject.finished_date = myFinished_date
            newProject.category = myCategory
            do {
                try self.managedObjectContext.save()
            } catch {
                print(error.localizedDescription)
            }
            self.isShown.toggle()
        }, label: {
                    Text("Add project")
        })
        }
    }
}

struct ProjectSheet_Previews: PreviewProvider {
    static var previews: some View {
        ProjectSheet(isShown: .constant(Bool()))
    }
}
