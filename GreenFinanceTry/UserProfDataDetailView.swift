//
//  UserProfDataDetailView.swift
//  GreenFinanceTry
//
//  Created by vincent schmitt on 17/03/2021.
//

import SwiftUI

struct UserProfDataDetailView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @State private var editMode = false
    @State private var editFirstName = ""
    @State private var editAge = ""
    
    @ObservedObject var element: UserProfData
    //var element: UserProfData
    
    init(elem: UserProfData) {
        self.element = elem
        self._editFirstName = State(initialValue: elem.firstName )
        self._editAge = State(initialValue: elem.age )
    }
    
    var body: some View {
        NavigationView {
        VStack {
            if editMode {

                TextField(element.firstName, text: $editFirstName)
                    .padding(.bottom)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            
                TextField(element.age, text: $editAge)
                    .padding(.bottom)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            } else {
                Text(element.firstName)
                Text(element.age)
            }
            Spacer()
            HStack {
                if editMode {
                    Button(action: {
                        let elem = self.element
                        self.element.firstName = self.editFirstName
                        self.element.age = self.editAge
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
        .navigationTitle("Profile of \(element.firstName)")
        }
        
    }
}

struct UserProfDataDetailView_Previews: PreviewProvider {
    static var previews: some View {

            let persistenceController = PersistenceController.shared
            let context = persistenceController.container.viewContext
            let usr = UserProfData(context: context)
            usr.id = UUID()
            usr.firstName = ""
            usr.age = ""
            
            return
                UserProfDataDetailView(elem: usr).environment(\.managedObjectContext, context)
    }
}
